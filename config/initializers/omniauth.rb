# frozen_string_literal: true

Rails.application.config.middleware.use OmniAuth::Builder do

config.omniauth :facebook, "755422288233320", "a2287dfabc963296575a8e2f9ccb86b4",
  client_options: { ssl: { ca_path: '/usr/lib/ssl/certs/ca-certificates.crt' } }
end
