# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: BUSL-1.1

require_relative '../linux/guest'

module VagrantPlugins
  module GuestMint
    class Guest < VagrantPlugins::GuestLinux::Guest
      # Name used for guest detection
      GUEST_DETECTION_NAME = "Linux Mint".freeze
    end
  end
end
