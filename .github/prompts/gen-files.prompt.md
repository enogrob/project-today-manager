---
mode: 'agent'
---
Generate an empty .md file in #folder:contents for the Subjec if specified or the underlying project stated in #file:README.md. The filename will have format "<subject>.md" . The `<subject>` , shall be replace by its name, and shall be in low case and no spaces, replacing them by `-`. For example for the Chapter "What is MCP Server?" the filename would be created as "YYYY-DD-MM_HHMMSS-what-is-mcp-server.md". The '<YYYY-DD-MM_HHMMSS>' part is the current date and time in UTC, formatted as "YYYY-DD-MM_HHMMSS". The file should be created in the #folder:contents directory.