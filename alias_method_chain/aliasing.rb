module RubyLearning
  module Aliasing
      #
      # 1. Strip out the final exclamation mark or question mark or equal mark
      #    from the name of the method, to put it at the end of the new aliases.
      #
      # 2. If block given, it can pass the aliased method name and punctuation
      #    to the block.
      #
      # 3. Alias the methods operation_with_feature() and operation_without_feature().
      #
      # 4. Set the same visibility as original method - private or public or protected
      #

      def alias_method_chain(target, feature)
        class_eval do
          matched = /([!?=])$/.match(feature)
          excl = matched.nil? ? "" : matched[0]
          feature_without_excl = feature.to_s.gsub(excl, "")
          feature_without_target_name = "#{feature_without_excl}_without_#{target}#{excl}".to_sym
          feature_with_target_name = "#{feature_without_excl}_with_#{target}#{excl}".to_sym
          yield(feature, target, feature_with_target_name) if block_given?
          feature_is_private = private_instance_methods.include? feature
          feature_is_protected = protected_instance_methods.include? feature
          alias_method feature_without_target_name, feature
          alias_method feature, feature_with_target_name
          private feature if feature_is_private
          protected feature if feature_is_protected
        end
    end
  end
end