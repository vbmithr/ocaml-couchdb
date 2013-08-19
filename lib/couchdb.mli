(** Types *)

type json = Yojson.Basic.json
type body = Cohttp_lwt_body.t

type h
(** Type of a handle. *)

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

val status_of_code : int -> status
val code_of_status : status -> int
val string_of_status : status -> string

type 'a reply = [ `Success of status * 'a | `Failure of status * string ]
(** Type of a DB reply. *)

(** Exceptions *)

exception Bad_reply
(** Exception returned when the DB reply with a HTTP response
    containing no body. This normally does not happen. *)

val handle : ?uri:string -> unit -> h Lwt.t

(** Database Methods *)

module DB : sig
  val info : h -> string -> Types_t.db_info reply Lwt.t
  val create : h -> string -> body reply Lwt.t
  val delete : h -> string -> body reply Lwt.t
end

(** Document Methods *)

module Doc : sig
  val add : h -> string -> json -> Types_t.doc_info reply Lwt.t
end

(** Miscellaneous Methods *)

module Misc : sig
  val srv_info: h -> Types_t.srv_info reply Lwt.t
  val list_dbs : h -> string list reply Lwt.t
end
