(* Auto-generated from "types.atd" *)


type vendor = Types_t.vendor = {
  vendorversion (*atd version *): string;
  vendorname (*atd name *): string
}

type srv_info = Types_t.srv_info = {
  srv_infocouchdb (*atd couchdb *): string;
  srv_infouuid (*atd uuid *): string;
  srv_infoversion (*atd version *): string;
  srv_infovendor (*atd vendor *): vendor
}

type status = Types_t.status = { ok: bool }

type error = Types_t.error = { error: string; reason: string }

type db_info = Types_t.db_info = {
  compact_running: bool;
  committed_update_seq: int;
  disk_format_version: int;
  disk_size: int;
  doc_count: int;
  doc_del_count: int;
  db_name: string;
  instance_start_time: string;
  purge_seq: int;
  update_seq: int
}

type doc_info = Types_t.doc_info = {
  docid (*atd id *): string;
  docok (*atd ok *): bool;
  docrev (*atd rev *): string
}

val write_vendor :
  Bi_outbuf.t -> vendor -> unit
  (** Output a JSON value of type {!vendor}. *)

val string_of_vendor :
  ?len:int -> vendor -> string
  (** Serialize a value of type {!vendor}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_vendor :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> vendor
  (** Input JSON data of type {!vendor}. *)

val vendor_of_string :
  string -> vendor
  (** Deserialize JSON data of type {!vendor}. *)

val write_srv_info :
  Bi_outbuf.t -> srv_info -> unit
  (** Output a JSON value of type {!srv_info}. *)

val string_of_srv_info :
  ?len:int -> srv_info -> string
  (** Serialize a value of type {!srv_info}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_srv_info :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> srv_info
  (** Input JSON data of type {!srv_info}. *)

val srv_info_of_string :
  string -> srv_info
  (** Deserialize JSON data of type {!srv_info}. *)

val write_status :
  Bi_outbuf.t -> status -> unit
  (** Output a JSON value of type {!status}. *)

val string_of_status :
  ?len:int -> status -> string
  (** Serialize a value of type {!status}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_status :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> status
  (** Input JSON data of type {!status}. *)

val status_of_string :
  string -> status
  (** Deserialize JSON data of type {!status}. *)

val write_error :
  Bi_outbuf.t -> error -> unit
  (** Output a JSON value of type {!error}. *)

val string_of_error :
  ?len:int -> error -> string
  (** Serialize a value of type {!error}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_error :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> error
  (** Input JSON data of type {!error}. *)

val error_of_string :
  string -> error
  (** Deserialize JSON data of type {!error}. *)

val write_db_info :
  Bi_outbuf.t -> db_info -> unit
  (** Output a JSON value of type {!db_info}. *)

val string_of_db_info :
  ?len:int -> db_info -> string
  (** Serialize a value of type {!db_info}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_db_info :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> db_info
  (** Input JSON data of type {!db_info}. *)

val db_info_of_string :
  string -> db_info
  (** Deserialize JSON data of type {!db_info}. *)

val write_doc_info :
  Bi_outbuf.t -> doc_info -> unit
  (** Output a JSON value of type {!doc_info}. *)

val string_of_doc_info :
  ?len:int -> doc_info -> string
  (** Serialize a value of type {!doc_info}
      into a JSON string.
      @param len specifies the initial length
                 of the buffer used internally.
                 Default: 1024. *)

val read_doc_info :
  Yojson.Safe.lexer_state -> Lexing.lexbuf -> doc_info
  (** Input JSON data of type {!doc_info}. *)

val doc_info_of_string :
  string -> doc_info
  (** Deserialize JSON data of type {!doc_info}. *)

