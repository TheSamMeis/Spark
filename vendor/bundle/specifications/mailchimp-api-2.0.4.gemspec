# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "mailchimp-api"
  s.version = "2.0.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["MailChimp Devs"]
  s.date = "2013-10-17"
  s.description = "A Ruby API library for the MailChimp email platform"
  s.email = "api@mailchimp.com"
  s.homepage = "https://bitbucket.org/mailchimp/mailchimp-api-ruby/"
  s.require_paths = ["lib"]
  s.rubygems_version = "2.0.2"
  s.summary = "A Ruby API library for the MailChimp email platform."

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<json>, [">= 1.7.7"])
      s.add_runtime_dependency(%q<excon>, [">= 0.16.0"])
    else
      s.add_dependency(%q<json>, [">= 1.7.7"])
      s.add_dependency(%q<excon>, [">= 0.16.0"])
    end
  else
    s.add_dependency(%q<json>, [">= 1.7.7"])
    s.add_dependency(%q<excon>, [">= 0.16.0"])
  end
end
