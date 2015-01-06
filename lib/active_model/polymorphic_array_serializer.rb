module ActiveModel
  class PolymorphicArraySerializer < ArraySerializer
    def serializer_for(item)
      if @each_serializer.is_a?(Hash) && polymorphic?
        polymorphic_object_key = item.class.name.underscore.to_sym
        return nil unless @each_serializer.has_key?(polymorphic_object_key)
        @each_serializer[polymorphic_object_key]
      else
        super
      end
    end
  end
end
