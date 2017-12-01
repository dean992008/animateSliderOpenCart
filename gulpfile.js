const gulp = require("gulp");

gulp.task("copy", () => {
  gulp.src("./upload/**/*")
    .pipe(gulp.dest("../mone/"));
});

gulp.task('watch', ['copy'], ()=>{
    gulp.watch('./upload/**/*', ['copy']);
});