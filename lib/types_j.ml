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

let write_vendor = (
  fun ob x ->
    Bi_outbuf.add_char ob '{';
    let is_first = ref true in
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"version\":";
    (
      Yojson.Safe.write_string
    )
      ob x.vendorversion;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"name\":";
    (
      Yojson.Safe.write_string
    )
      ob x.vendorname;
    Bi_outbuf.add_char ob '}';
)
let string_of_vendor ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write_vendor ob x;
  Bi_outbuf.contents ob
let read_vendor = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    Yojson.Safe.read_lcurl p lb;
    let x =
      {
        vendorversion = Obj.magic 0.0;
        vendorname = Obj.magic 0.0;
      }
    in
    let bits0 = ref 0 in
    try
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_object_end lb;
      Yojson.Safe.read_space p lb;
      let f =
        fun s pos len ->
          if pos < 0 || len < 0 || pos + len > String.length s then
            invalid_arg "out-of-bounds substring position or length";
          match len with
            | 4 -> (
                if String.unsafe_get s pos = 'n' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'e' then (
                  1
                )
                else (
                  -1
                )
              )
            | 7 -> (
                if String.unsafe_get s pos = 'v' && String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'r' && String.unsafe_get s (pos+3) = 's' && String.unsafe_get s (pos+4) = 'i' && String.unsafe_get s (pos+5) = 'o' && String.unsafe_get s (pos+6) = 'n' then (
                  0
                )
                else (
                  -1
                )
              )
            | _ -> (
                -1
              )
      in
      let i = Yojson.Safe.map_ident p f lb in
      Ag_oj_run.read_until_field_value p lb;
      (
        match i with
          | 0 ->
            let v =
              (
                Ag_oj_run.read_string
              ) p lb
            in
            Obj.set_field (Obj.repr x) 0 (Obj.repr v);
            bits0 := !bits0 lor 0x1;
          | 1 ->
            let v =
              (
                Ag_oj_run.read_string
              ) p lb
            in
            Obj.set_field (Obj.repr x) 1 (Obj.repr v);
            bits0 := !bits0 lor 0x2;
          | _ -> (
              Yojson.Safe.skip_json p lb
            )
      );
      while true do
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_sep p lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg "out-of-bounds substring position or length";
            match len with
              | 4 -> (
                  if String.unsafe_get s pos = 'n' && String.unsafe_get s (pos+1) = 'a' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'e' then (
                    1
                  )
                  else (
                    -1
                  )
                )
              | 7 -> (
                  if String.unsafe_get s pos = 'v' && String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'r' && String.unsafe_get s (pos+3) = 's' && String.unsafe_get s (pos+4) = 'i' && String.unsafe_get s (pos+5) = 'o' && String.unsafe_get s (pos+6) = 'n' then (
                    0
                  )
                  else (
                    -1
                  )
                )
              | _ -> (
                  -1
                )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Ag_oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              let v =
                (
                  Ag_oj_run.read_string
                ) p lb
              in
              Obj.set_field (Obj.repr x) 0 (Obj.repr v);
              bits0 := !bits0 lor 0x1;
            | 1 ->
              let v =
                (
                  Ag_oj_run.read_string
                ) p lb
              in
              Obj.set_field (Obj.repr x) 1 (Obj.repr v);
              bits0 := !bits0 lor 0x2;
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
      done;
      assert false;
    with Yojson.End_of_object -> (
        if !bits0 <> 0x3 then Ag_oj_run.missing_fields [| !bits0 |] [| "version"; "name" |];
        Ag_oj_run.identity x
      )
)
let vendor_of_string s =
  read_vendor (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_srv_info = (
  fun ob x ->
    Bi_outbuf.add_char ob '{';
    let is_first = ref true in
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"couchdb\":";
    (
      Yojson.Safe.write_string
    )
      ob x.srv_infocouchdb;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"uuid\":";
    (
      Yojson.Safe.write_string
    )
      ob x.srv_infouuid;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"version\":";
    (
      Yojson.Safe.write_string
    )
      ob x.srv_infoversion;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"vendor\":";
    (
      write_vendor
    )
      ob x.srv_infovendor;
    Bi_outbuf.add_char ob '}';
)
let string_of_srv_info ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write_srv_info ob x;
  Bi_outbuf.contents ob
let read_srv_info = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    Yojson.Safe.read_lcurl p lb;
    let x =
      {
        srv_infocouchdb = Obj.magic 0.0;
        srv_infouuid = Obj.magic 0.0;
        srv_infoversion = Obj.magic 0.0;
        srv_infovendor = Obj.magic 0.0;
      }
    in
    let bits0 = ref 0 in
    try
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_object_end lb;
      Yojson.Safe.read_space p lb;
      let f =
        fun s pos len ->
          if pos < 0 || len < 0 || pos + len > String.length s then
            invalid_arg "out-of-bounds substring position or length";
          match len with
            | 4 -> (
                if String.unsafe_get s pos = 'u' && String.unsafe_get s (pos+1) = 'u' && String.unsafe_get s (pos+2) = 'i' && String.unsafe_get s (pos+3) = 'd' then (
                  1
                )
                else (
                  -1
                )
              )
            | 6 -> (
                if String.unsafe_get s pos = 'v' && String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'n' && String.unsafe_get s (pos+3) = 'd' && String.unsafe_get s (pos+4) = 'o' && String.unsafe_get s (pos+5) = 'r' then (
                  3
                )
                else (
                  -1
                )
              )
            | 7 -> (
                match String.unsafe_get s pos with
                  | 'c' -> (
                      if String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'u' && String.unsafe_get s (pos+3) = 'c' && String.unsafe_get s (pos+4) = 'h' && String.unsafe_get s (pos+5) = 'd' && String.unsafe_get s (pos+6) = 'b' then (
                        0
                      )
                      else (
                        -1
                      )
                    )
                  | 'v' -> (
                      if String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'r' && String.unsafe_get s (pos+3) = 's' && String.unsafe_get s (pos+4) = 'i' && String.unsafe_get s (pos+5) = 'o' && String.unsafe_get s (pos+6) = 'n' then (
                        2
                      )
                      else (
                        -1
                      )
                    )
                  | _ -> (
                      -1
                    )
              )
            | _ -> (
                -1
              )
      in
      let i = Yojson.Safe.map_ident p f lb in
      Ag_oj_run.read_until_field_value p lb;
      (
        match i with
          | 0 ->
            let v =
              (
                Ag_oj_run.read_string
              ) p lb
            in
            Obj.set_field (Obj.repr x) 0 (Obj.repr v);
            bits0 := !bits0 lor 0x1;
          | 1 ->
            let v =
              (
                Ag_oj_run.read_string
              ) p lb
            in
            Obj.set_field (Obj.repr x) 1 (Obj.repr v);
            bits0 := !bits0 lor 0x2;
          | 2 ->
            let v =
              (
                Ag_oj_run.read_string
              ) p lb
            in
            Obj.set_field (Obj.repr x) 2 (Obj.repr v);
            bits0 := !bits0 lor 0x4;
          | 3 ->
            let v =
              (
                read_vendor
              ) p lb
            in
            Obj.set_field (Obj.repr x) 3 (Obj.repr v);
            bits0 := !bits0 lor 0x8;
          | _ -> (
              Yojson.Safe.skip_json p lb
            )
      );
      while true do
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_sep p lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg "out-of-bounds substring position or length";
            match len with
              | 4 -> (
                  if String.unsafe_get s pos = 'u' && String.unsafe_get s (pos+1) = 'u' && String.unsafe_get s (pos+2) = 'i' && String.unsafe_get s (pos+3) = 'd' then (
                    1
                  )
                  else (
                    -1
                  )
                )
              | 6 -> (
                  if String.unsafe_get s pos = 'v' && String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'n' && String.unsafe_get s (pos+3) = 'd' && String.unsafe_get s (pos+4) = 'o' && String.unsafe_get s (pos+5) = 'r' then (
                    3
                  )
                  else (
                    -1
                  )
                )
              | 7 -> (
                  match String.unsafe_get s pos with
                    | 'c' -> (
                        if String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'u' && String.unsafe_get s (pos+3) = 'c' && String.unsafe_get s (pos+4) = 'h' && String.unsafe_get s (pos+5) = 'd' && String.unsafe_get s (pos+6) = 'b' then (
                          0
                        )
                        else (
                          -1
                        )
                      )
                    | 'v' -> (
                        if String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'r' && String.unsafe_get s (pos+3) = 's' && String.unsafe_get s (pos+4) = 'i' && String.unsafe_get s (pos+5) = 'o' && String.unsafe_get s (pos+6) = 'n' then (
                          2
                        )
                        else (
                          -1
                        )
                      )
                    | _ -> (
                        -1
                      )
                )
              | _ -> (
                  -1
                )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Ag_oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              let v =
                (
                  Ag_oj_run.read_string
                ) p lb
              in
              Obj.set_field (Obj.repr x) 0 (Obj.repr v);
              bits0 := !bits0 lor 0x1;
            | 1 ->
              let v =
                (
                  Ag_oj_run.read_string
                ) p lb
              in
              Obj.set_field (Obj.repr x) 1 (Obj.repr v);
              bits0 := !bits0 lor 0x2;
            | 2 ->
              let v =
                (
                  Ag_oj_run.read_string
                ) p lb
              in
              Obj.set_field (Obj.repr x) 2 (Obj.repr v);
              bits0 := !bits0 lor 0x4;
            | 3 ->
              let v =
                (
                  read_vendor
                ) p lb
              in
              Obj.set_field (Obj.repr x) 3 (Obj.repr v);
              bits0 := !bits0 lor 0x8;
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
      done;
      assert false;
    with Yojson.End_of_object -> (
        if !bits0 <> 0xf then Ag_oj_run.missing_fields [| !bits0 |] [| "couchdb"; "uuid"; "version"; "vendor" |];
        Ag_oj_run.identity x
      )
)
let srv_info_of_string s =
  read_srv_info (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_status = (
  fun ob x ->
    Bi_outbuf.add_char ob '{';
    let is_first = ref true in
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"ok\":";
    (
      Yojson.Safe.write_bool
    )
      ob x.ok;
    Bi_outbuf.add_char ob '}';
)
let string_of_status ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write_status ob x;
  Bi_outbuf.contents ob
let read_status = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    Yojson.Safe.read_lcurl p lb;
    let x =
      {
        ok = Obj.magic 0.0;
      }
    in
    let bits0 = ref 0 in
    try
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_object_end lb;
      Yojson.Safe.read_space p lb;
      let f =
        fun s pos len ->
          if pos < 0 || len < 0 || pos + len > String.length s then
            invalid_arg "out-of-bounds substring position or length";
          if len = 2 && String.unsafe_get s pos = 'o' && String.unsafe_get s (pos+1) = 'k' then (
            0
          )
          else (
            -1
          )
      in
      let i = Yojson.Safe.map_ident p f lb in
      Ag_oj_run.read_until_field_value p lb;
      (
        match i with
          | 0 ->
            let v =
              (
                Ag_oj_run.read_bool
              ) p lb
            in
            Obj.set_field (Obj.repr x) 0 (Obj.repr v);
            bits0 := !bits0 lor 0x1;
          | _ -> (
              Yojson.Safe.skip_json p lb
            )
      );
      while true do
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_sep p lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg "out-of-bounds substring position or length";
            if len = 2 && String.unsafe_get s pos = 'o' && String.unsafe_get s (pos+1) = 'k' then (
              0
            )
            else (
              -1
            )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Ag_oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              let v =
                (
                  Ag_oj_run.read_bool
                ) p lb
              in
              Obj.set_field (Obj.repr x) 0 (Obj.repr v);
              bits0 := !bits0 lor 0x1;
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
      done;
      assert false;
    with Yojson.End_of_object -> (
        if !bits0 <> 0x1 then Ag_oj_run.missing_fields [| !bits0 |] [| "ok" |];
        Ag_oj_run.identity x
      )
)
let status_of_string s =
  read_status (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_error = (
  fun ob x ->
    Bi_outbuf.add_char ob '{';
    let is_first = ref true in
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"error\":";
    (
      Yojson.Safe.write_string
    )
      ob x.error;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"reason\":";
    (
      Yojson.Safe.write_string
    )
      ob x.reason;
    Bi_outbuf.add_char ob '}';
)
let string_of_error ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write_error ob x;
  Bi_outbuf.contents ob
let read_error = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    Yojson.Safe.read_lcurl p lb;
    let x =
      {
        error = Obj.magic 0.0;
        reason = Obj.magic 0.0;
      }
    in
    let bits0 = ref 0 in
    try
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_object_end lb;
      Yojson.Safe.read_space p lb;
      let f =
        fun s pos len ->
          if pos < 0 || len < 0 || pos + len > String.length s then
            invalid_arg "out-of-bounds substring position or length";
          match len with
            | 5 -> (
                if String.unsafe_get s pos = 'e' && String.unsafe_get s (pos+1) = 'r' && String.unsafe_get s (pos+2) = 'r' && String.unsafe_get s (pos+3) = 'o' && String.unsafe_get s (pos+4) = 'r' then (
                  0
                )
                else (
                  -1
                )
              )
            | 6 -> (
                if String.unsafe_get s pos = 'r' && String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'a' && String.unsafe_get s (pos+3) = 's' && String.unsafe_get s (pos+4) = 'o' && String.unsafe_get s (pos+5) = 'n' then (
                  1
                )
                else (
                  -1
                )
              )
            | _ -> (
                -1
              )
      in
      let i = Yojson.Safe.map_ident p f lb in
      Ag_oj_run.read_until_field_value p lb;
      (
        match i with
          | 0 ->
            let v =
              (
                Ag_oj_run.read_string
              ) p lb
            in
            Obj.set_field (Obj.repr x) 0 (Obj.repr v);
            bits0 := !bits0 lor 0x1;
          | 1 ->
            let v =
              (
                Ag_oj_run.read_string
              ) p lb
            in
            Obj.set_field (Obj.repr x) 1 (Obj.repr v);
            bits0 := !bits0 lor 0x2;
          | _ -> (
              Yojson.Safe.skip_json p lb
            )
      );
      while true do
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_sep p lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg "out-of-bounds substring position or length";
            match len with
              | 5 -> (
                  if String.unsafe_get s pos = 'e' && String.unsafe_get s (pos+1) = 'r' && String.unsafe_get s (pos+2) = 'r' && String.unsafe_get s (pos+3) = 'o' && String.unsafe_get s (pos+4) = 'r' then (
                    0
                  )
                  else (
                    -1
                  )
                )
              | 6 -> (
                  if String.unsafe_get s pos = 'r' && String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'a' && String.unsafe_get s (pos+3) = 's' && String.unsafe_get s (pos+4) = 'o' && String.unsafe_get s (pos+5) = 'n' then (
                    1
                  )
                  else (
                    -1
                  )
                )
              | _ -> (
                  -1
                )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Ag_oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              let v =
                (
                  Ag_oj_run.read_string
                ) p lb
              in
              Obj.set_field (Obj.repr x) 0 (Obj.repr v);
              bits0 := !bits0 lor 0x1;
            | 1 ->
              let v =
                (
                  Ag_oj_run.read_string
                ) p lb
              in
              Obj.set_field (Obj.repr x) 1 (Obj.repr v);
              bits0 := !bits0 lor 0x2;
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
      done;
      assert false;
    with Yojson.End_of_object -> (
        if !bits0 <> 0x3 then Ag_oj_run.missing_fields [| !bits0 |] [| "error"; "reason" |];
        Ag_oj_run.identity x
      )
)
let error_of_string s =
  read_error (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_db_info = (
  fun ob x ->
    Bi_outbuf.add_char ob '{';
    let is_first = ref true in
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"compact_running\":";
    (
      Yojson.Safe.write_bool
    )
      ob x.compact_running;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"committed_update_seq\":";
    (
      Yojson.Safe.write_int
    )
      ob x.committed_update_seq;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"disk_format_version\":";
    (
      Yojson.Safe.write_int
    )
      ob x.disk_format_version;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"disk_size\":";
    (
      Yojson.Safe.write_int
    )
      ob x.disk_size;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"doc_count\":";
    (
      Yojson.Safe.write_int
    )
      ob x.doc_count;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"doc_del_count\":";
    (
      Yojson.Safe.write_int
    )
      ob x.doc_del_count;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"db_name\":";
    (
      Yojson.Safe.write_string
    )
      ob x.db_name;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"instance_start_time\":";
    (
      Yojson.Safe.write_string
    )
      ob x.instance_start_time;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"purge_seq\":";
    (
      Yojson.Safe.write_int
    )
      ob x.purge_seq;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"update_seq\":";
    (
      Yojson.Safe.write_int
    )
      ob x.update_seq;
    Bi_outbuf.add_char ob '}';
)
let string_of_db_info ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write_db_info ob x;
  Bi_outbuf.contents ob
let read_db_info = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    Yojson.Safe.read_lcurl p lb;
    let x =
      {
        compact_running = Obj.magic 0.0;
        committed_update_seq = Obj.magic 0.0;
        disk_format_version = Obj.magic 0.0;
        disk_size = Obj.magic 0.0;
        doc_count = Obj.magic 0.0;
        doc_del_count = Obj.magic 0.0;
        db_name = Obj.magic 0.0;
        instance_start_time = Obj.magic 0.0;
        purge_seq = Obj.magic 0.0;
        update_seq = Obj.magic 0.0;
      }
    in
    let bits0 = ref 0 in
    try
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_object_end lb;
      Yojson.Safe.read_space p lb;
      let f =
        fun s pos len ->
          if pos < 0 || len < 0 || pos + len > String.length s then
            invalid_arg "out-of-bounds substring position or length";
          match len with
            | 7 -> (
                if String.unsafe_get s pos = 'd' && String.unsafe_get s (pos+1) = 'b' && String.unsafe_get s (pos+2) = '_' && String.unsafe_get s (pos+3) = 'n' && String.unsafe_get s (pos+4) = 'a' && String.unsafe_get s (pos+5) = 'm' && String.unsafe_get s (pos+6) = 'e' then (
                  6
                )
                else (
                  -1
                )
              )
            | 9 -> (
                match String.unsafe_get s pos with
                  | 'd' -> (
                      match String.unsafe_get s (pos+1) with
                        | 'i' -> (
                            if String.unsafe_get s (pos+2) = 's' && String.unsafe_get s (pos+3) = 'k' && String.unsafe_get s (pos+4) = '_' && String.unsafe_get s (pos+5) = 's' && String.unsafe_get s (pos+6) = 'i' && String.unsafe_get s (pos+7) = 'z' && String.unsafe_get s (pos+8) = 'e' then (
                              3
                            )
                            else (
                              -1
                            )
                          )
                        | 'o' -> (
                            if String.unsafe_get s (pos+2) = 'c' && String.unsafe_get s (pos+3) = '_' && String.unsafe_get s (pos+4) = 'c' && String.unsafe_get s (pos+5) = 'o' && String.unsafe_get s (pos+6) = 'u' && String.unsafe_get s (pos+7) = 'n' && String.unsafe_get s (pos+8) = 't' then (
                              4
                            )
                            else (
                              -1
                            )
                          )
                        | _ -> (
                            -1
                          )
                    )
                  | 'p' -> (
                      if String.unsafe_get s (pos+1) = 'u' && String.unsafe_get s (pos+2) = 'r' && String.unsafe_get s (pos+3) = 'g' && String.unsafe_get s (pos+4) = 'e' && String.unsafe_get s (pos+5) = '_' && String.unsafe_get s (pos+6) = 's' && String.unsafe_get s (pos+7) = 'e' && String.unsafe_get s (pos+8) = 'q' then (
                        8
                      )
                      else (
                        -1
                      )
                    )
                  | _ -> (
                      -1
                    )
              )
            | 10 -> (
                if String.unsafe_get s pos = 'u' && String.unsafe_get s (pos+1) = 'p' && String.unsafe_get s (pos+2) = 'd' && String.unsafe_get s (pos+3) = 'a' && String.unsafe_get s (pos+4) = 't' && String.unsafe_get s (pos+5) = 'e' && String.unsafe_get s (pos+6) = '_' && String.unsafe_get s (pos+7) = 's' && String.unsafe_get s (pos+8) = 'e' && String.unsafe_get s (pos+9) = 'q' then (
                  9
                )
                else (
                  -1
                )
              )
            | 13 -> (
                if String.unsafe_get s pos = 'd' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'c' && String.unsafe_get s (pos+3) = '_' && String.unsafe_get s (pos+4) = 'd' && String.unsafe_get s (pos+5) = 'e' && String.unsafe_get s (pos+6) = 'l' && String.unsafe_get s (pos+7) = '_' && String.unsafe_get s (pos+8) = 'c' && String.unsafe_get s (pos+9) = 'o' && String.unsafe_get s (pos+10) = 'u' && String.unsafe_get s (pos+11) = 'n' && String.unsafe_get s (pos+12) = 't' then (
                  5
                )
                else (
                  -1
                )
              )
            | 15 -> (
                if String.unsafe_get s pos = 'c' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'p' && String.unsafe_get s (pos+4) = 'a' && String.unsafe_get s (pos+5) = 'c' && String.unsafe_get s (pos+6) = 't' && String.unsafe_get s (pos+7) = '_' && String.unsafe_get s (pos+8) = 'r' && String.unsafe_get s (pos+9) = 'u' && String.unsafe_get s (pos+10) = 'n' && String.unsafe_get s (pos+11) = 'n' && String.unsafe_get s (pos+12) = 'i' && String.unsafe_get s (pos+13) = 'n' && String.unsafe_get s (pos+14) = 'g' then (
                  0
                )
                else (
                  -1
                )
              )
            | 19 -> (
                match String.unsafe_get s pos with
                  | 'd' -> (
                      if String.unsafe_get s (pos+1) = 'i' && String.unsafe_get s (pos+2) = 's' && String.unsafe_get s (pos+3) = 'k' && String.unsafe_get s (pos+4) = '_' && String.unsafe_get s (pos+5) = 'f' && String.unsafe_get s (pos+6) = 'o' && String.unsafe_get s (pos+7) = 'r' && String.unsafe_get s (pos+8) = 'm' && String.unsafe_get s (pos+9) = 'a' && String.unsafe_get s (pos+10) = 't' && String.unsafe_get s (pos+11) = '_' && String.unsafe_get s (pos+12) = 'v' && String.unsafe_get s (pos+13) = 'e' && String.unsafe_get s (pos+14) = 'r' && String.unsafe_get s (pos+15) = 's' && String.unsafe_get s (pos+16) = 'i' && String.unsafe_get s (pos+17) = 'o' && String.unsafe_get s (pos+18) = 'n' then (
                        2
                      )
                      else (
                        -1
                      )
                    )
                  | 'i' -> (
                      if String.unsafe_get s (pos+1) = 'n' && String.unsafe_get s (pos+2) = 's' && String.unsafe_get s (pos+3) = 't' && String.unsafe_get s (pos+4) = 'a' && String.unsafe_get s (pos+5) = 'n' && String.unsafe_get s (pos+6) = 'c' && String.unsafe_get s (pos+7) = 'e' && String.unsafe_get s (pos+8) = '_' && String.unsafe_get s (pos+9) = 's' && String.unsafe_get s (pos+10) = 't' && String.unsafe_get s (pos+11) = 'a' && String.unsafe_get s (pos+12) = 'r' && String.unsafe_get s (pos+13) = 't' && String.unsafe_get s (pos+14) = '_' && String.unsafe_get s (pos+15) = 't' && String.unsafe_get s (pos+16) = 'i' && String.unsafe_get s (pos+17) = 'm' && String.unsafe_get s (pos+18) = 'e' then (
                        7
                      )
                      else (
                        -1
                      )
                    )
                  | _ -> (
                      -1
                    )
              )
            | 20 -> (
                if String.unsafe_get s pos = 'c' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'm' && String.unsafe_get s (pos+4) = 'i' && String.unsafe_get s (pos+5) = 't' && String.unsafe_get s (pos+6) = 't' && String.unsafe_get s (pos+7) = 'e' && String.unsafe_get s (pos+8) = 'd' && String.unsafe_get s (pos+9) = '_' && String.unsafe_get s (pos+10) = 'u' && String.unsafe_get s (pos+11) = 'p' && String.unsafe_get s (pos+12) = 'd' && String.unsafe_get s (pos+13) = 'a' && String.unsafe_get s (pos+14) = 't' && String.unsafe_get s (pos+15) = 'e' && String.unsafe_get s (pos+16) = '_' && String.unsafe_get s (pos+17) = 's' && String.unsafe_get s (pos+18) = 'e' && String.unsafe_get s (pos+19) = 'q' then (
                  1
                )
                else (
                  -1
                )
              )
            | _ -> (
                -1
              )
      in
      let i = Yojson.Safe.map_ident p f lb in
      Ag_oj_run.read_until_field_value p lb;
      (
        match i with
          | 0 ->
            let v =
              (
                Ag_oj_run.read_bool
              ) p lb
            in
            Obj.set_field (Obj.repr x) 0 (Obj.repr v);
            bits0 := !bits0 lor 0x1;
          | 1 ->
            let v =
              (
                Ag_oj_run.read_int
              ) p lb
            in
            Obj.set_field (Obj.repr x) 1 (Obj.repr v);
            bits0 := !bits0 lor 0x2;
          | 2 ->
            let v =
              (
                Ag_oj_run.read_int
              ) p lb
            in
            Obj.set_field (Obj.repr x) 2 (Obj.repr v);
            bits0 := !bits0 lor 0x4;
          | 3 ->
            let v =
              (
                Ag_oj_run.read_int
              ) p lb
            in
            Obj.set_field (Obj.repr x) 3 (Obj.repr v);
            bits0 := !bits0 lor 0x8;
          | 4 ->
            let v =
              (
                Ag_oj_run.read_int
              ) p lb
            in
            Obj.set_field (Obj.repr x) 4 (Obj.repr v);
            bits0 := !bits0 lor 0x10;
          | 5 ->
            let v =
              (
                Ag_oj_run.read_int
              ) p lb
            in
            Obj.set_field (Obj.repr x) 5 (Obj.repr v);
            bits0 := !bits0 lor 0x20;
          | 6 ->
            let v =
              (
                Ag_oj_run.read_string
              ) p lb
            in
            Obj.set_field (Obj.repr x) 6 (Obj.repr v);
            bits0 := !bits0 lor 0x40;
          | 7 ->
            let v =
              (
                Ag_oj_run.read_string
              ) p lb
            in
            Obj.set_field (Obj.repr x) 7 (Obj.repr v);
            bits0 := !bits0 lor 0x80;
          | 8 ->
            let v =
              (
                Ag_oj_run.read_int
              ) p lb
            in
            Obj.set_field (Obj.repr x) 8 (Obj.repr v);
            bits0 := !bits0 lor 0x100;
          | 9 ->
            let v =
              (
                Ag_oj_run.read_int
              ) p lb
            in
            Obj.set_field (Obj.repr x) 9 (Obj.repr v);
            bits0 := !bits0 lor 0x200;
          | _ -> (
              Yojson.Safe.skip_json p lb
            )
      );
      while true do
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_sep p lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg "out-of-bounds substring position or length";
            match len with
              | 7 -> (
                  if String.unsafe_get s pos = 'd' && String.unsafe_get s (pos+1) = 'b' && String.unsafe_get s (pos+2) = '_' && String.unsafe_get s (pos+3) = 'n' && String.unsafe_get s (pos+4) = 'a' && String.unsafe_get s (pos+5) = 'm' && String.unsafe_get s (pos+6) = 'e' then (
                    6
                  )
                  else (
                    -1
                  )
                )
              | 9 -> (
                  match String.unsafe_get s pos with
                    | 'd' -> (
                        match String.unsafe_get s (pos+1) with
                          | 'i' -> (
                              if String.unsafe_get s (pos+2) = 's' && String.unsafe_get s (pos+3) = 'k' && String.unsafe_get s (pos+4) = '_' && String.unsafe_get s (pos+5) = 's' && String.unsafe_get s (pos+6) = 'i' && String.unsafe_get s (pos+7) = 'z' && String.unsafe_get s (pos+8) = 'e' then (
                                3
                              )
                              else (
                                -1
                              )
                            )
                          | 'o' -> (
                              if String.unsafe_get s (pos+2) = 'c' && String.unsafe_get s (pos+3) = '_' && String.unsafe_get s (pos+4) = 'c' && String.unsafe_get s (pos+5) = 'o' && String.unsafe_get s (pos+6) = 'u' && String.unsafe_get s (pos+7) = 'n' && String.unsafe_get s (pos+8) = 't' then (
                                4
                              )
                              else (
                                -1
                              )
                            )
                          | _ -> (
                              -1
                            )
                      )
                    | 'p' -> (
                        if String.unsafe_get s (pos+1) = 'u' && String.unsafe_get s (pos+2) = 'r' && String.unsafe_get s (pos+3) = 'g' && String.unsafe_get s (pos+4) = 'e' && String.unsafe_get s (pos+5) = '_' && String.unsafe_get s (pos+6) = 's' && String.unsafe_get s (pos+7) = 'e' && String.unsafe_get s (pos+8) = 'q' then (
                          8
                        )
                        else (
                          -1
                        )
                      )
                    | _ -> (
                        -1
                      )
                )
              | 10 -> (
                  if String.unsafe_get s pos = 'u' && String.unsafe_get s (pos+1) = 'p' && String.unsafe_get s (pos+2) = 'd' && String.unsafe_get s (pos+3) = 'a' && String.unsafe_get s (pos+4) = 't' && String.unsafe_get s (pos+5) = 'e' && String.unsafe_get s (pos+6) = '_' && String.unsafe_get s (pos+7) = 's' && String.unsafe_get s (pos+8) = 'e' && String.unsafe_get s (pos+9) = 'q' then (
                    9
                  )
                  else (
                    -1
                  )
                )
              | 13 -> (
                  if String.unsafe_get s pos = 'd' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'c' && String.unsafe_get s (pos+3) = '_' && String.unsafe_get s (pos+4) = 'd' && String.unsafe_get s (pos+5) = 'e' && String.unsafe_get s (pos+6) = 'l' && String.unsafe_get s (pos+7) = '_' && String.unsafe_get s (pos+8) = 'c' && String.unsafe_get s (pos+9) = 'o' && String.unsafe_get s (pos+10) = 'u' && String.unsafe_get s (pos+11) = 'n' && String.unsafe_get s (pos+12) = 't' then (
                    5
                  )
                  else (
                    -1
                  )
                )
              | 15 -> (
                  if String.unsafe_get s pos = 'c' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'p' && String.unsafe_get s (pos+4) = 'a' && String.unsafe_get s (pos+5) = 'c' && String.unsafe_get s (pos+6) = 't' && String.unsafe_get s (pos+7) = '_' && String.unsafe_get s (pos+8) = 'r' && String.unsafe_get s (pos+9) = 'u' && String.unsafe_get s (pos+10) = 'n' && String.unsafe_get s (pos+11) = 'n' && String.unsafe_get s (pos+12) = 'i' && String.unsafe_get s (pos+13) = 'n' && String.unsafe_get s (pos+14) = 'g' then (
                    0
                  )
                  else (
                    -1
                  )
                )
              | 19 -> (
                  match String.unsafe_get s pos with
                    | 'd' -> (
                        if String.unsafe_get s (pos+1) = 'i' && String.unsafe_get s (pos+2) = 's' && String.unsafe_get s (pos+3) = 'k' && String.unsafe_get s (pos+4) = '_' && String.unsafe_get s (pos+5) = 'f' && String.unsafe_get s (pos+6) = 'o' && String.unsafe_get s (pos+7) = 'r' && String.unsafe_get s (pos+8) = 'm' && String.unsafe_get s (pos+9) = 'a' && String.unsafe_get s (pos+10) = 't' && String.unsafe_get s (pos+11) = '_' && String.unsafe_get s (pos+12) = 'v' && String.unsafe_get s (pos+13) = 'e' && String.unsafe_get s (pos+14) = 'r' && String.unsafe_get s (pos+15) = 's' && String.unsafe_get s (pos+16) = 'i' && String.unsafe_get s (pos+17) = 'o' && String.unsafe_get s (pos+18) = 'n' then (
                          2
                        )
                        else (
                          -1
                        )
                      )
                    | 'i' -> (
                        if String.unsafe_get s (pos+1) = 'n' && String.unsafe_get s (pos+2) = 's' && String.unsafe_get s (pos+3) = 't' && String.unsafe_get s (pos+4) = 'a' && String.unsafe_get s (pos+5) = 'n' && String.unsafe_get s (pos+6) = 'c' && String.unsafe_get s (pos+7) = 'e' && String.unsafe_get s (pos+8) = '_' && String.unsafe_get s (pos+9) = 's' && String.unsafe_get s (pos+10) = 't' && String.unsafe_get s (pos+11) = 'a' && String.unsafe_get s (pos+12) = 'r' && String.unsafe_get s (pos+13) = 't' && String.unsafe_get s (pos+14) = '_' && String.unsafe_get s (pos+15) = 't' && String.unsafe_get s (pos+16) = 'i' && String.unsafe_get s (pos+17) = 'm' && String.unsafe_get s (pos+18) = 'e' then (
                          7
                        )
                        else (
                          -1
                        )
                      )
                    | _ -> (
                        -1
                      )
                )
              | 20 -> (
                  if String.unsafe_get s pos = 'c' && String.unsafe_get s (pos+1) = 'o' && String.unsafe_get s (pos+2) = 'm' && String.unsafe_get s (pos+3) = 'm' && String.unsafe_get s (pos+4) = 'i' && String.unsafe_get s (pos+5) = 't' && String.unsafe_get s (pos+6) = 't' && String.unsafe_get s (pos+7) = 'e' && String.unsafe_get s (pos+8) = 'd' && String.unsafe_get s (pos+9) = '_' && String.unsafe_get s (pos+10) = 'u' && String.unsafe_get s (pos+11) = 'p' && String.unsafe_get s (pos+12) = 'd' && String.unsafe_get s (pos+13) = 'a' && String.unsafe_get s (pos+14) = 't' && String.unsafe_get s (pos+15) = 'e' && String.unsafe_get s (pos+16) = '_' && String.unsafe_get s (pos+17) = 's' && String.unsafe_get s (pos+18) = 'e' && String.unsafe_get s (pos+19) = 'q' then (
                    1
                  )
                  else (
                    -1
                  )
                )
              | _ -> (
                  -1
                )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Ag_oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              let v =
                (
                  Ag_oj_run.read_bool
                ) p lb
              in
              Obj.set_field (Obj.repr x) 0 (Obj.repr v);
              bits0 := !bits0 lor 0x1;
            | 1 ->
              let v =
                (
                  Ag_oj_run.read_int
                ) p lb
              in
              Obj.set_field (Obj.repr x) 1 (Obj.repr v);
              bits0 := !bits0 lor 0x2;
            | 2 ->
              let v =
                (
                  Ag_oj_run.read_int
                ) p lb
              in
              Obj.set_field (Obj.repr x) 2 (Obj.repr v);
              bits0 := !bits0 lor 0x4;
            | 3 ->
              let v =
                (
                  Ag_oj_run.read_int
                ) p lb
              in
              Obj.set_field (Obj.repr x) 3 (Obj.repr v);
              bits0 := !bits0 lor 0x8;
            | 4 ->
              let v =
                (
                  Ag_oj_run.read_int
                ) p lb
              in
              Obj.set_field (Obj.repr x) 4 (Obj.repr v);
              bits0 := !bits0 lor 0x10;
            | 5 ->
              let v =
                (
                  Ag_oj_run.read_int
                ) p lb
              in
              Obj.set_field (Obj.repr x) 5 (Obj.repr v);
              bits0 := !bits0 lor 0x20;
            | 6 ->
              let v =
                (
                  Ag_oj_run.read_string
                ) p lb
              in
              Obj.set_field (Obj.repr x) 6 (Obj.repr v);
              bits0 := !bits0 lor 0x40;
            | 7 ->
              let v =
                (
                  Ag_oj_run.read_string
                ) p lb
              in
              Obj.set_field (Obj.repr x) 7 (Obj.repr v);
              bits0 := !bits0 lor 0x80;
            | 8 ->
              let v =
                (
                  Ag_oj_run.read_int
                ) p lb
              in
              Obj.set_field (Obj.repr x) 8 (Obj.repr v);
              bits0 := !bits0 lor 0x100;
            | 9 ->
              let v =
                (
                  Ag_oj_run.read_int
                ) p lb
              in
              Obj.set_field (Obj.repr x) 9 (Obj.repr v);
              bits0 := !bits0 lor 0x200;
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
      done;
      assert false;
    with Yojson.End_of_object -> (
        if !bits0 <> 0x3ff then Ag_oj_run.missing_fields [| !bits0 |] [| "compact_running"; "committed_update_seq"; "disk_format_version"; "disk_size"; "doc_count"; "doc_del_count"; "db_name"; "instance_start_time"; "purge_seq"; "update_seq" |];
        Ag_oj_run.identity x
      )
)
let db_info_of_string s =
  read_db_info (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
let write_doc_info = (
  fun ob x ->
    Bi_outbuf.add_char ob '{';
    let is_first = ref true in
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"id\":";
    (
      Yojson.Safe.write_string
    )
      ob x.docid;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"ok\":";
    (
      Yojson.Safe.write_bool
    )
      ob x.docok;
    if !is_first then
      is_first := false
    else
      Bi_outbuf.add_char ob ',';
    Bi_outbuf.add_string ob "\"rev\":";
    (
      Yojson.Safe.write_string
    )
      ob x.docrev;
    Bi_outbuf.add_char ob '}';
)
let string_of_doc_info ?(len = 1024) x =
  let ob = Bi_outbuf.create len in
  write_doc_info ob x;
  Bi_outbuf.contents ob
let read_doc_info = (
  fun p lb ->
    Yojson.Safe.read_space p lb;
    Yojson.Safe.read_lcurl p lb;
    let x =
      {
        docid = Obj.magic 0.0;
        docok = Obj.magic 0.0;
        docrev = Obj.magic 0.0;
      }
    in
    let bits0 = ref 0 in
    try
      Yojson.Safe.read_space p lb;
      Yojson.Safe.read_object_end lb;
      Yojson.Safe.read_space p lb;
      let f =
        fun s pos len ->
          if pos < 0 || len < 0 || pos + len > String.length s then
            invalid_arg "out-of-bounds substring position or length";
          match len with
            | 2 -> (
                match String.unsafe_get s pos with
                  | 'i' -> (
                      if String.unsafe_get s (pos+1) = 'd' then (
                        0
                      )
                      else (
                        -1
                      )
                    )
                  | 'o' -> (
                      if String.unsafe_get s (pos+1) = 'k' then (
                        1
                      )
                      else (
                        -1
                      )
                    )
                  | _ -> (
                      -1
                    )
              )
            | 3 -> (
                if String.unsafe_get s pos = 'r' && String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'v' then (
                  2
                )
                else (
                  -1
                )
              )
            | _ -> (
                -1
              )
      in
      let i = Yojson.Safe.map_ident p f lb in
      Ag_oj_run.read_until_field_value p lb;
      (
        match i with
          | 0 ->
            let v =
              (
                Ag_oj_run.read_string
              ) p lb
            in
            Obj.set_field (Obj.repr x) 0 (Obj.repr v);
            bits0 := !bits0 lor 0x1;
          | 1 ->
            let v =
              (
                Ag_oj_run.read_bool
              ) p lb
            in
            Obj.set_field (Obj.repr x) 1 (Obj.repr v);
            bits0 := !bits0 lor 0x2;
          | 2 ->
            let v =
              (
                Ag_oj_run.read_string
              ) p lb
            in
            Obj.set_field (Obj.repr x) 2 (Obj.repr v);
            bits0 := !bits0 lor 0x4;
          | _ -> (
              Yojson.Safe.skip_json p lb
            )
      );
      while true do
        Yojson.Safe.read_space p lb;
        Yojson.Safe.read_object_sep p lb;
        Yojson.Safe.read_space p lb;
        let f =
          fun s pos len ->
            if pos < 0 || len < 0 || pos + len > String.length s then
              invalid_arg "out-of-bounds substring position or length";
            match len with
              | 2 -> (
                  match String.unsafe_get s pos with
                    | 'i' -> (
                        if String.unsafe_get s (pos+1) = 'd' then (
                          0
                        )
                        else (
                          -1
                        )
                      )
                    | 'o' -> (
                        if String.unsafe_get s (pos+1) = 'k' then (
                          1
                        )
                        else (
                          -1
                        )
                      )
                    | _ -> (
                        -1
                      )
                )
              | 3 -> (
                  if String.unsafe_get s pos = 'r' && String.unsafe_get s (pos+1) = 'e' && String.unsafe_get s (pos+2) = 'v' then (
                    2
                  )
                  else (
                    -1
                  )
                )
              | _ -> (
                  -1
                )
        in
        let i = Yojson.Safe.map_ident p f lb in
        Ag_oj_run.read_until_field_value p lb;
        (
          match i with
            | 0 ->
              let v =
                (
                  Ag_oj_run.read_string
                ) p lb
              in
              Obj.set_field (Obj.repr x) 0 (Obj.repr v);
              bits0 := !bits0 lor 0x1;
            | 1 ->
              let v =
                (
                  Ag_oj_run.read_bool
                ) p lb
              in
              Obj.set_field (Obj.repr x) 1 (Obj.repr v);
              bits0 := !bits0 lor 0x2;
            | 2 ->
              let v =
                (
                  Ag_oj_run.read_string
                ) p lb
              in
              Obj.set_field (Obj.repr x) 2 (Obj.repr v);
              bits0 := !bits0 lor 0x4;
            | _ -> (
                Yojson.Safe.skip_json p lb
              )
        );
      done;
      assert false;
    with Yojson.End_of_object -> (
        if !bits0 <> 0x7 then Ag_oj_run.missing_fields [| !bits0 |] [| "id"; "ok"; "rev" |];
        Ag_oj_run.identity x
      )
)
let doc_info_of_string s =
  read_doc_info (Yojson.Safe.init_lexer ()) (Lexing.from_string s)
