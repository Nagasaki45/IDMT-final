while inotifywait --quiet --event move_self --event modify report/report.md; do
  make report-build
done;
