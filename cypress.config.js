const { defineConfig } = require("cypress");

module.exports = defineConfig({
  e2e: {
    setupNodeEvents(on, config) {
      // implement node event listeners here
    },
  },
  screenshotsFolder: "cypress/screenshots",
  videosFolder: "cypress/videos",
  viewportWidth: 1920,
  viewportHeight: 1080
});
