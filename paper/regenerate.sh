while inotifywait --quiet --event move_self --event modify paper/paper.tex; do
  make paper-build
done;
