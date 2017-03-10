module Error = struct
  type t = {
    error : string ;
    reason : string ;
  }

  let encoding =
    let open Json_encoding in
    conv
      (fun { error ; reason } -> (error, reason))
      (fun (error, reason) -> { error ; reason })
      (obj2
         (req "error" string)
         (req "reason" string))
end

module Db = struct
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

  let encoding =
    let open Json_encoding in
    conv
      (fun { committed_update_seq ; compact_running ;
             disk_format_version ; disk_size ;
             doc_count ; doc_del_count ;
             db_name ; instance_start_time ;
             purge_seq ; update_seq } ->
        (committed_update_seq, compact_running,
         disk_format_version, disk_size, doc_count,
         doc_del_count, db_name, instance_start_time,
         purge_seq, update_seq)
      )
      (fun (committed_update_seq, compact_running,
            disk_format_version, disk_size, doc_count,
            doc_del_count, db_name, instance_start_time,
            purge_seq, update_seq) ->
        { committed_update_seq ; compact_running ;
          disk_format_version ; disk_size ;
          doc_count ; doc_del_count ;
          db_name ; instance_start_time ;
          purge_seq ; update_seq })
      (obj10
         (req "committed_update_seq" int)
         (req "compact_runnnig" bool)
         (req "disk_format_version" int)
         (req "disk_size" int)
         (req "doc_count" int)
         (req "doc_del_count" int)
         (req "db_name" string)
         (req "instance_start_time" string)
         (req "purge_seq" int)
         (req "update_seq" int))

  let of_json =
    Json_encoding.destruct encoding
  let of_string str =
    Json_encoding.destruct encoding (Ezjsonm.from_string str)
end

module Document = struct
  module Response = struct
    module Put = struct
      type t = {
        id: string;
        ok: bool;
        rev: string;
      }

      let encoding =
        let open Json_encoding in
        conv
          (fun { id ; ok ; rev } -> (id, ok, rev))
          (fun (id, ok, rev) -> { id ; ok ; rev })
          (obj3
             (req "id" string)
             (req "ok" bool)
             (req "rev" string))

      let of_json =
        Json_encoding.destruct encoding
      let of_string str =
        Json_encoding.destruct encoding (Ezjsonm.from_string str)
    end
  end
end

module Server = struct
  module Info = struct

    type vendor = {
      version: string;
      name: string;
    }

    let vendor_encoding =
      let open Json_encoding in
      conv
        (fun { version ; name } -> (version, name))
        (fun (version, name) -> { version ; name })
        (obj2
           (req "version" string)
           (req "name" string))

    type t = {
      couchdb: string;
      uuid: string;
      version: string;
      vendor: vendor ;
    }

    let encoding =
      let open Json_encoding in
      conv
        (fun { couchdb ; uuid ; version ; vendor } ->
           (couchdb, uuid, version, vendor))
        (fun (couchdb, uuid, version, vendor) ->
           { couchdb ; uuid ; version ; vendor })
        (obj4
           (req "couchdb" string)
           (req "uuid" string)
           (req "version" string)
           (req "vendor" vendor_encoding))

    let of_json =
      Json_encoding.destruct encoding
    let of_string str =
      Json_encoding.destruct encoding (Ezjsonm.from_string str)
  end
end

type status = {
  ok: bool;
}



