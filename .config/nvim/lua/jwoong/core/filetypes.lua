-- Neovim detects compose files as plain `yaml`, but docker_language_server
-- only attaches to `yaml.docker-compose`. Match variant names too
-- (e.g. docker-compose-airflow.yaml).
vim.filetype.add({
  pattern = {
    ["docker%-compose.*%.ya?ml"] = "yaml.docker-compose",
    ["compose.*%.ya?ml"] = "yaml.docker-compose",
  },
})
