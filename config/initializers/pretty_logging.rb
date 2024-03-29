if ENV['PRETTY_LOGGING']
  puts "Pretty Logging enabled..."
  module ActiveSupport

    # Format the buffered logger with timestamp/severity info.
    class BufferedLogger
      NUMBER_TO_NAME_MAP  = {0=>'DEBUG', 1=>'INFO', 2=>'WARN', 3=>'ERROR', 4=>'FATAL', 5=>'UNKNOWN'}
      NUMBER_TO_COLOR_MAP = {0=>'0;37', 1=>'32', 2=>'33', 3=>'31', 4=>'31', 5=>'37'}

      def add(severity, message = nil, progname = nil, &block)
        return if @level > severity
        sevstring = NUMBER_TO_NAME_MAP[severity]
        color     = NUMBER_TO_COLOR_MAP[severity]
        unless message.class != ''.class or message[-1] == ?\n
          message = "\033[0;37m#{Time.now.to_s(:db)}\033[0m [\033[#{color}m" + sprintf("%-5s","#{sevstring}") + "\033[0m] #{message.strip} (pid:#{$$})\n"
        end
        buffer << message
        auto_flush
        message
      end
    end
  end
end
