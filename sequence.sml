fun is_in_list nil _ = false
  | is_in_list (x::xs) y =
    x = y orelse is_in_list xs y;

fun is_in_lists nil _ = true (*el is in all of no lists*)
  | is_in_lists (L::Ls) el =
    is_in_list L el andalso is_in_lists Ls el;

(*common_element takes a list of lists and returns *)
(*an element common to all inner lists or NONE*)
fun common_element nil = NONE
  | common_element (L::Ls) =
    let
      fun f lists (el, _) =
        if is_in_lists lists el
        then SOME(el)
        else NONE;
    in
      foldl (f Ls) NONE L
    end;

(*removes the element (2nd arg) from the lists (1st arg)*)
fun remove_from_list nil _ = nil
  | remove_from_list (x::xs) y =
    if x = y then remove_from_list xs y
    else x :: remove_from_list xs y;

(*removes the element (2nd arg) from the lists in the list (1st arg)*)
fun remove_from_lists nil _ = nil
  | remove_from_lists (L::Ls) x =
    remove_from_list L x :: remove_from_lists Ls x;

fun remove_empty_lists nil = nil
  | remove_empty_lists (nil::rest) = remove_empty_lists rest
  | remove_empty_lists (L::rest) = L :: remove_empty_lists rest;
          
(*seq function takes a'' list list representing a set of sets
* and returns an a'' list representing an ordered tuple*)
exception InputError;
fun seq nil = nil
  | seq Ls =
    case common_element Ls of
      SOME(x) =>
        x :: seq(remove_empty_lists(remove_from_lists Ls x))
     | NONE => raise InputError

