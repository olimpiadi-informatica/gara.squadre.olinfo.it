import { defineConfig } from "astro/config";

import tailwind from "@astrojs/tailwind";

import react from "@astrojs/react";

export default defineConfig({
  build: {
    inlineStylesheets: "always",
  },
  integrations: [
    tailwind(),
    react({ experimentalReactChildren: true }),
  ],
  vite: {
    ssr: {
      noExternal: ["@olinfo/react-components"],
    }
  }
});