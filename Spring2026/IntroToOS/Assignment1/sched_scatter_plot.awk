BEGIN {
  num_processes = 0;

  if (x_axis=="") { x_axis = "sum_exec_runtime"; }
  if (y_axis=="") { y_axis = "vruntime"; }

  if (x=="") { x = 100; }
  if (y=="") { y = 30; }
}

FNR == 1 {
  num_processes++;
}

match($1, y_axis) { y_axis_vals[num_processes-1]=$3; next; }
match($1, x_axis) { x_axis_vals[num_processes-1]=$3; next; }

END {
  asort(y_axis_vals);
  asort(x_axis_vals);

  print y_axis;

  for (i=1; i<=num_processes; i++) {
    y_axis_vals[i] = log(y_axis_vals[i] + 2) / log(2);
    x_axis_vals[i] = log(x_axis_vals[i] + 2) / log(2);
  }

  x_scale = int(x / x_axis_vals[num_processes - 1]);
  y_scale = int(y / y_axis_vals[num_processes - 1]);

  printf("%d, %d", x_scale, y_scale);

  for (i=1; i<=num_processes; i++) {
    x_coord = int(x_scale * x_axis_vals[i]);
    y_coord = int(y_scale * y_axis_vals[i]);

    plot[x_coord, y_coord] += 1;
    if (plot[x_coord, y_coord] > 9) { plot[x_coord, y_coord] = 9; }
  }

  print "   ^";
  for (curr_y=y; curr_y > 0; curr_y--) {
    printf "   |";
    for (curr_x=0; curr_x<x; curr_x++) {
      printf (plot[curr_x, curr_y] ? plot[curr_x, curr_y] : " ");
    }
    printf "\n";
  }
  
  printf "   +";
  for (i=0; i<x; i++) { printf "-"; }
  printf ("> %s\n", x_axis);

}

