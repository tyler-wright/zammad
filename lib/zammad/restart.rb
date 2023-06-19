# Copyright (C) 2012-2023 Zammad Foundation, https://zammad-foundation.org/

module Zammad
  module Restart
    def self.perform
      if ENV['APP_RESTART_CMD']
        AppVersion.set(true, 'restart_auto')
        sleep 4
        AppVersionRestartJob.perform_later(ENV['APP_RESTART_CMD'])
      else
        AppVersion.set(true, 'restart_manual')
      end

      true
    end
  end
end
