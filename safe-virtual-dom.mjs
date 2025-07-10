import { replaceKernelPackages } from "./elm-kernel-replacements/replace-kernel-packages.mjs";

export default function safeVirtualDom() {
  console.log("Patching with Simon Lydell's elm-safe-virtual-dom fixes")

  replaceKernelPackages();
  process.exit(0);
}

safeVirtualDom()
