val x = 0;
val y = true;

fun f x = if y then x else x + 1;

y = false;
f 4; (*Result: 4*)