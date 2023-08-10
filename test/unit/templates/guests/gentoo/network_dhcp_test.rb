# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: BUSL-1.1

require_relative "../../../base"

require "vagrant/util/template_renderer"

describe "templates/guests/gentoo/network_dhcp" do
  let(:template) { "guests/gentoo/network_dhcp" }

  it "renders the template" do
    result = Vagrant::Util::TemplateRenderer.render(template, options: {
      device: "en0",
    })
    expect(result).to eq <<-EOH.gsub(/^ {6}/, "")
      #VAGRANT-BEGIN
      # The contents below are automatically generated by Vagrant. Do not modify.
      config_en0="dhcp"
      #VAGRANT-END
    EOH
  end
end
