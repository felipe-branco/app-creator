const { nodeExternalsPlugin } = require('esbuild-node-externals')

const buildShallow =
  process.argv.includes('--shallow')

require('esbuild').build({
  logLevel: 'info',
  entryPoints: ['src/index.ts'],
  bundle: true,
  sourcemap: true,
  outdir: 'dist',
  platform: 'node',
  plugins: buildShallow ? [nodeExternalsPlugin()] : [],
})
