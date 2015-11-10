module Overcommit::Hook::PreCommit
  # Search each line for a match against specified regex patterns
  class SearchPattern < Base
    def run
      errors = []
      warnings = []

      # Get and compile search patterns
      search_patterns = config['patterns']
      patterns = Hash[*search_patterns.map do |pattern|
        [ pattern, Regexp.new(pattern) ]
      end.flatten]

      # Iterate over each file applicable for this hook
      applicable_files.each do |file|
        modified_lines_num = modified_lines_in_file(file)

        File.open(file, 'r').each_with_index do |line, index|
          # Match line against each search pattern
          patterns.each do |pattern, regex|
            next unless regex =~ line

            message = "#{file}:#{index + 1}: Found pattern `#{pattern}`: #{line}"

            if modified_lines_num.include?(index + 1)
              errors << message
            else
              warnings << message
            end
          end
        end
      end

      return :fail, errors.join("\n") if errors.any?

      return :warn, "Modified files had existing errors\n" <<
        warnings.join("\n") if warnings.any?

      :pass
    end
  end
end
