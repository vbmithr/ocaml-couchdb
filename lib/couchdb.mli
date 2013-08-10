(** Types *)

type json = Yojson.Basic.json

type h
(** Type of a handle. *)

type status =
    [ `Ok | `Created | `Accepted |
    `Not_Modified | `Bad_Request |
    `Unauthorized | `Forbidden |
    `Not_Found | `Resource_Not_Allowed |
    `Not_Acceptable | `Conflict |
    `Precondition_Failed | `Bad_Content_Type |
    `Requested_Range_Not_Satisfiable |
    `Expectation_Failed | `Internal_Server_Error ]

val status_of_code : int -> status
val code_of_status : status -> int

(** Exceptions *)

exception Error of status * string
exception Connection_error

val handle : ?uri:string -> unit -> h

(** Database Methods *)

module DB : sig
  val info : h -> string -> (status * Types_t.db_info) Lwt.t
  val create : h -> string -> status Lwt.t
  val delete : h -> string -> status Lwt.t
end

(** Document Methods *)

module Doc : sig
  val add : ?id:string -> h -> string -> json -> (status * Types_t.doc_info) Lwt.t
end

(** Miscellaneous Methods *)

module Misc : sig
  val srv_info: h -> (status * Types_t.srv_info) Lwt.t
  val list_dbs : h -> (status * string list) Lwt.t
end
