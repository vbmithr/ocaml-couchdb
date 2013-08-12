(* Auto-generated from "types.atd" *)


type vendor = {
  vendor_version (*atd version *): string;
  vendor_name (*atd name *): string
}

type srv_info = {
  srv_info_couchdb (*atd couchdb *): string;
  srv_info_uuid (*atd uuid *): string;
  srv_info_version (*atd version *): string;
  srv_info_vendor (*atd vendor *): vendor
}

type status = { ok: bool }

type error = { error: string; reason: string }

type db_info = {
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

type doc_info = {
  doc_info_id (*atd id *): string;
  doc_info_ok (*atd ok *): bool;
  doc_info_rev (*atd rev *): string
}
