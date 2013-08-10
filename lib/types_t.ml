(* Auto-generated from "types.atd" *)


type vendor = {
  vendorversion (*atd version *): string;
  vendorname (*atd name *): string
}

type srv_info = {
  srv_infocouchdb (*atd couchdb *): string;
  srv_infouuid (*atd uuid *): string;
  srv_infoversion (*atd version *): string;
  srv_infovendor (*atd vendor *): vendor
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
  docid (*atd id *): string;
  docok (*atd ok *): bool;
  docrev (*atd rev *): string
}
