module C = Cohttp
module CB = Cohttp_lwt_body
module CU = Cohttp_lwt_unix.Client

let (>>=) = Lwt.bind
let (|>) a b = b a

type json = Yojson.Basic.json
type body = Cohttp_lwt_body.t

type h = {
  uri: Uri.t;
}

type status =
    [ `Ok
    | `Created
    | `Accepted
    | `Not_Modified
    | `Bad_Request
    | `Unauthorized
    | `Forbidden
    | `Not_Found
    | `Resource_Not_Allowed
    | `Not_Acceptable
    | `Conflict
    | `Precondition_Failed
    | `Bad_Content_Type
    | `Requested_Range_Not_Satisfiable
    | `Expectation_Failed
    | `Internal_Server_Error
    ]

let code_of_status = function
  | `Ok -> 200
  | `Created -> 201
  | `Accepted -> 202
  | `Not_Modified -> 304
  | `Bad_Request -> 400
  | `Unauthorized -> 401
  | `Forbidden -> 403
  | `Not_Found -> 404
  | `Resource_Not_Allowed -> 405
  | `Not_Acceptable -> 406
  | `Conflict -> 409
  | `Precondition_Failed -> 412
  | `Bad_Content_Type -> 415
  | `Requested_Range_Not_Satisfiable -> 416
  | `Expectation_Failed -> 417
  | `Internal_Server_Error -> 500

let status_of_code = function
  | 200 -> `Ok
  | 201 -> `Created
  | 202 -> `Accepted
  | 304 -> `Not_Modified
  | 400 -> `Bad_Request
  | 401 -> `Unauthorized
  | 403 -> `Forbidden
  | 404 -> `Not_Found
  | 405 -> `Resource_Not_Allowed
  | 406 -> `Not_Acceptable
  | 409 -> `Conflict
  | 412 -> `Precondition_Failed
  | 415 -> `Bad_Content_Type
  | 416 -> `Requested_Range_Not_Satisfiable
  | 417 -> `Expectation_Failed
  | 500 -> `Internal_Server_Error
  | _ -> raise (Invalid_argument "Not a valid status code")

type 'a reply = [ `Success of status * 'a | `Failure of status * string ]

exception Connection_failure
exception Bad_reply

let code_of_resp resp =
  C.Response.status resp |> C.Code.code_of_status

let call ?headers ?body ?chunked uri meth path =
  let uri = Uri.with_path uri ("/" ^ path) in
  CU.call ?headers ?body ?chunked meth uri >>=
  function
  | Some (resp, body) ->
    let code = code_of_resp resp in
    if code >= 400 then
      CB.string_of_body body >>= fun bs ->
      let ret = Types_j.error_of_string bs in
      Lwt.return (`Failure (status_of_code code, ret.Types_j.reason))
    else
      Lwt.return (`Success ((status_of_code code), body))
  | None -> Lwt.fail Bad_reply

let transform_reply_body f = function
  | `Success (code, body) ->
    CB.string_of_body body >>= fun bs -> Lwt.return (`Success (code, f bs))
  | `Failure (code, reason) as e -> Lwt.return e

let handle ?(uri="http://localhost:5984") () =
  let uri_ = Uri.of_string uri in
  Lwt.try_bind (fun () -> call uri_ `GET "")
  (fun _ -> Lwt.return { uri=uri_ })
  (fun exn -> Lwt.fail (Invalid_argument ("Cannot connect to " ^ uri)))

module DB = struct
  let info h db_name =
    call h.uri `GET db_name
    >>= fun r -> transform_reply_body Types_j.db_info_of_string r

  let create h db_name = call h.uri `PUT db_name
  let delete h db_name = call h.uri `DELETE db_name
end

module Doc = struct
  let add ?id h db_name doc_json =
    (* CouchDB does not support documents that are not dicts *)
    (match doc_json with
     | `Assoc _ -> Lwt.return ()
     | _ ->
       Lwt.fail (Invalid_argument "Document must be a JSON object"))
    >>= fun () ->
    let doc_json = match id with
      | None -> doc_json
      | Some id ->
        (match doc_json with
         | `Assoc dict -> `Assoc (("_id", `String id)::dict)
         | _ -> assert false) in
    let body = Yojson.Basic.to_string doc_json in
    let body = CB.body_of_string body in
    let headers = C.Header.init_with "Content-Type" "application/json" in
    call ~headers ?body h.uri `POST db_name
    >>= fun r -> transform_reply_body Types_j.doc_info_of_string r
end

module Misc = struct
  let srv_info h =
    call h.uri `GET ""
    >>= fun r -> transform_reply_body Types_j.srv_info_of_string r

  let list_dbs h =
    call h.uri `GET "_all_dbs"
    >>= fun r -> transform_reply_body
      Yojson.Basic.(fun bs -> from_string bs |> Util.to_list |> Util.filter_string) r
end
