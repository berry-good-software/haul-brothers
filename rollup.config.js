import { babel } from '@rollup/plugin-babel';
import { nodeResolve } from '@rollup/plugin-node-resolve';
import eslint from '@rollup/plugin-eslint';

export default {
    input: './_js/app.js',
    output: {
        file: './assets/js/app.js',
        format: 'es',
        sourcemap: true
    },
    plugins: [eslint(), nodeResolve(), babel({ babelHelpers: 'bundled' })]
};
