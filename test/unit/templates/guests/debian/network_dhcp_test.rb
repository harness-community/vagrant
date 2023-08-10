# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: BUSL-1.1

require_relative "../../../base"

require "vagrant/util/template_renderer"

describe "templates/guests/debian/network_dhcp" do
  let(:template) { "guests/debian/network_dhcp" }

  it "renders the template" do
    result = Vagrant::Util::TemplateRenderer.render(template, options: {
      device: "eth1",
    })
    expect(result).to eq <<-EOH.gsub(/^ {6}/, "")
      #VAGRANT-BEGIN
      # The contents below are automatically generated by Vagrant. Do not modify.
      auto eth1
      iface eth1 inet dhcp
          post-up ip route del default dev $IFACE || true
      #VAGRANT-END
    EOH
  end

  context "when use_dhcp_assigned_default_route is set" do
    it "renders the template" do
      result = Vagrant::Util::TemplateRenderer.render(template, options: {
        device: "eth1",
        root_device: "eth0",
        use_dhcp_assigned_default_route: true,
      })
      expect(result).to eq <<-EOH.gsub(/^ {8}/, "")
        #VAGRANT-BEGIN
        # The contents below are automatically generated by Vagrant. Do not modify.
        auto eth1
        iface eth1 inet dhcp
            # We need to disable eth0, see GH-2648
            post-up ip route del default dev eth0 || true
            post-up dhclient $IFACE
            pre-down ip route add default dev eth0
        #VAGRANT-END
      EOH
    end
  end
end
