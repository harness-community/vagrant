# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: BUSL-1.1

# Generated by the protocol buffer compiler.  DO NOT EDIT!
# Source: proto/ruby_vagrant/ruby-server.proto for package 'hashicorp.vagrant'

require 'grpc'
require 'proto/ruby_vagrant/ruby-server_pb'

module Hashicorp
  module Vagrant
    module RubyVagrant
      # The service that is implemented for the server backend.
      class Service

        include GRPC::GenericService

        self.marshal_class_method = :encode
        self.unmarshal_class_method = :decode
        self.service_name = 'hashicorp.vagrant.RubyVagrant'

        # Gets available ruby plugins
        rpc :GetPlugins, ::Google::Protobuf::Empty, ::Hashicorp::Vagrant::GetPluginsResponse
        rpc :ParseVagrantfile, ::Hashicorp::Vagrant::ParseVagrantfileRequest, ::Hashicorp::Vagrant::ParseVagrantfileResponse
      end

      Stub = Service.rpc_stub_class
    end
  end
end
