local status_ok, solargraph_settings = pcall(require, "nlspsettings.solargraph")
if not status_ok then
  return
end

-- without this, solargraph will not work if root has .rubocop.yml file
solargraph_settings.setup {
  cmd = {'solargraph', 'stdio'}
}
