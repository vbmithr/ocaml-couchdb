open Couchdb

type t

val open_uri : Uri.t -> t Lwt.t

type error = {
  code : Cohttp.Code.status_code ;
  error : string ;
  reason : string ;
}

(** Database Methods *)

module Db : sig
  val info : t -> string -> (Db.t, error) result Lwt.t
  val create : t -> string -> (bool, error) result Lwt.t
  val delete : t -> string -> (bool, error) result Lwt.t
end

(** Document Methods *)

module Document : sig
  val add : t -> string -> Ezjsonm.t ->
    (Document.Response.Put.t, error) result Lwt.t
end

(** Miscellaneous Methods *)

module Misc : sig
  val srv_info: t -> (Server.Info.t, error) result Lwt.t
  val list_dbs : t -> (string list, error) result Lwt.t
end
