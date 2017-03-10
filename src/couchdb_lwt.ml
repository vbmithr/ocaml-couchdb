open Couchdb
open Rresult
open Lwt.Infix

open Cohttp_lwt_unix
module Body = Cohttp_lwt_body

type t = {
  uri: Uri.t;
}

let code_of_resp resp =
  Response.status resp |> Cohttp.Code.code_of_status

type error = {
  code : Cohttp.Code.status_code ;
  error : string ;
  reason : string ;
}

let read_error code json =
  let err = Json_encoding.destruct Error.encoding json in
  { code ; error = err.error ; reason = err.reason }

module Http = struct
  let get ?headers uri path =
    let uri = Uri.with_path uri path in
    Client.get ?headers uri >>= fun (resp, body) ->
    Body.to_string body >>= fun bs ->
    let body_json = Ezjsonm.from_string bs in
    let code = code_of_resp resp in
    if code >= 400 then
      Lwt.return (Error (read_error resp.status body_json))
    else
      Lwt.return (Ok body_json)

  let call
      ?(meth=`POST) ?chunked ?(headers=Cohttp.Header.init ()) ?body uri path =
    let uri = Uri.with_path uri path in
    let headers = Cohttp.Header.add headers "Content-Type" "application/json" in
    let body = match body with
      | None -> None
      | Some body -> Some (Body.of_string (Ezjsonm.to_string body)) in
    Client.call ?chunked ~headers ?body meth uri >>= fun (resp, resp_body) ->
    Body.to_string resp_body >>= fun resp_bs ->
    let resp_body_json = Ezjsonm.from_string resp_bs in
    let code = code_of_resp resp in
    if code >= 400 then
      Lwt.return (Error (read_error resp.status resp_body_json))
    else
      Lwt.return (Ok resp_body_json)
end

let open_uri uri =
  Http.get uri "" >|= fun _ -> { uri }

module Db = struct
  let info h db_name =
    Http.get h.uri db_name >|=
    R.map Db.of_json

  let create h db_name =
    Http.call ~meth:`PUT h.uri db_name >|=
    R.map Json_encoding.(destruct (obj1 (req "ok" bool)))

  let delete h db_name =
    Http.call ~meth:`DELETE h.uri db_name >|=
    R.map Json_encoding.(destruct (obj1 (req "ok" bool)))
end

module Document = struct
  let add h db_name body =
    Http.call ~meth:`POST ~body h.uri db_name >|=
    R.map Document.Response.Put.of_json
end

module Misc = struct
  let srv_info h =
    Http.get h.uri "" >|=
    R.map Couchdb.Server.Info.of_json

  let list_dbs h =
    Http.get h.uri "_all_dbs" >|=
    R.map Json_encoding.(destruct (list string))
end
