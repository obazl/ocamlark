(library
 (name tezos_version)
 (public_name tezos-version)
 (libraries tezos-base)
 (flags (:standard -open Tezos_base__TzPervasives)))

(rule
 (targets generated_git_info.ml)
 ; Ensures the hash update whenever a source file is modified ;
 (deps (universe) (:script get-git-info.mlt))
 (action (with-stdout-to %{targets} (run %{ocaml} unix.cma %{script}))))
