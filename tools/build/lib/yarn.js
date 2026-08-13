import Juke from '../juke/index.js';

let yarnPath;

export const yarn = (...args) => {
  if (!yarnPath) {
    yarnPath = Juke.glob('./tgui/.yarn/releases/*.cjs')[0]
      .replace('/tgui/', '/');
  }
  // Use the same Node that is running this build (vendored bootstrap under
  // TGS may not put `node` on PATH; bare `spawn('node')` then fails ENOENT).
  return Juke.exec(process.execPath, [
    yarnPath,
    ...args.filter((arg) => typeof arg === 'string'),
  ], {
    cwd: './tgui',
  });
};
