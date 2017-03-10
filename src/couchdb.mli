module Error : sig
  type t = {
    error: string;
    reason: string;
  }

  val encoding : t Json_encoding.encoding
end

module Db : sig
  type t = {
    committed_update_seq: int;
    compact_running: bool;
    disk_format_version: int;
    disk_size: int;
    doc_count: int;
    doc_del_count: int;
    db_name: string;
    instance_start_time: string;
    purge_seq: int;
    update_seq: int;
  }

  val encoding : t Json_encoding.encoding
  val of_json : Json_repr.ezjsonm -> t
  val of_string : string -> t
end

module Document : sig
  module Response : sig
    module Put : sig
      type t = {
        id: string;
        ok: bool;
        rev: string;
      }

      val encoding : t Json_encoding.encoding
      val of_json : Json_repr.ezjsonm -> t
      val of_string : string -> t
    end
  end
end

module Server : sig
  module Info : sig

    type vendor = {
      version: string;
      name: string;
    }

    type t = {
      couchdb: string;
      uuid: string;
      version: string;
      vendor: vendor ;
    }

    val encoding : t Json_encoding.encoding
    val of_json : Json_repr.ezjsonm -> t
    val of_string : string -> t
  end
end

type status = {
  ok: bool;
}

