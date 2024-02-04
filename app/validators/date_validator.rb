# app/validators/date_validator.rb

class DateValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)
      if value.present? && !value.is_a?(Date)
        record.errors.add(attribute, "must be a valid date")
      end
    end
  end
  