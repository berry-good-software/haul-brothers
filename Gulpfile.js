import gulp from 'gulp';
import autoprefixer from 'gulp-autoprefixer';
import dartSass from 'sass';
import gulpSass from 'gulp-sass';
import sourcemaps from 'gulp-sourcemaps';

const sass = gulpSass(dartSass);

const sassInput = './_sass/**/*.scss';
const output = './assets';

const sassOptions = {
    errLogToConsole: true,
    outputStyle: 'compressed'
};

async function watch() {
    await buildSass();
    gulp.watch(sassInput, buildSass);
}

async function buildSass() {
    await gulp
        .src(sassInput)
        .pipe(sourcemaps.init())
        .pipe(sass(sassOptions).on('error', sass.logError))
        .pipe(sourcemaps.write())
        .pipe(autoprefixer())
        .pipe(gulp.dest(`${output}/css/`));
}

export {buildSass, watch};
