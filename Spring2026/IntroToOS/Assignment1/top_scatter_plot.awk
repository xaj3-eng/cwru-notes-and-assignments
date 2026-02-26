BEGIN {
  num_processes = 0;
  processing_lines_bool = 0;

  if (x_axis=="") { x_axis = "PID"; }
  if (y_axis=="") { y_axis = "TIME"; }

  if (x=="") { x = 100; }
  if (y=="") { y = 30; }
}


match($0, x_axis) && match($0, y_axis) {
  processing_lines_bool = 1;
  print $0;

  for (i=1; i<100; i++) {
    if (match($i, x_axis)) {
      x_col = i;
    }
    if (match($i, y_axis)) {
      y_col = i;
    }
  }

  next;
}

processing_lines_bool { num_processes++;
  x_axis_vals[num_processes]=$x_col;
  y_axis_vals[num_processes]=$y_col;
}

END {
  print num_processes;

  if (!processing_lines_bool) {
    print "Processes not found";
    exit;
  }

  asort(y_axis_vals);
  asort(x_axis_vals);

  print y_axis;

  if (log_scale_x > 1 || log_scale_y > 1) {
    for (i=1; i<=num_processes; i++) {
      if (log_scale_x) {
        x_axis_vals[i] = log(x_axis_vals[i] + 1) / log(log_scale_x);
      } if (log_scale_y) {
        y_axis_vals[i] = log(y_axis_vals[i] + 1) / log(log_scale_y);
      }
    }
  }

  x_max = x_axis_vals[num_processes];
  y_max = y_axis_vals[num_processes];
  x_scale = (x_max > 0) ? x / x_max : 1;
  y_scale = (y_max > 0) ? y / y_max : 1;

  for (i=1; i<=num_processes; i++) {
    x_coord = int(x_scale * x_axis_vals[i]);
    y_coord = int(y_scale * y_axis_vals[i]);

    plot[x_coord, y_coord] += 1;
    if (plot[x_coord, y_coord] > 9) { plot[x_coord, y_coord] = 9; }
  }

  print "  ^";
  for (curr_y=y; curr_y >= 0; curr_y--) {
    printf "  |";
    for (curr_x=0; curr_x<=x; curr_x++) {
      printf (plot[curr_x, curr_y] ? plot[curr_x, curr_y] : " ");
    }
    printf "\n";
  }

  printf "  +";
  for (i=0; i<x; i++) { printf "-"; }
  printf ("> %s\n", x_axis);

}

