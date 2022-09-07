# rubocop:disable Layout/LineLength, Metrics/MethodLength
require './label'
# the label class
module AddLabel
  def list_all_label
    if @labels.empty?
      puts_message 'No label listed in the collection'
      return
    end
    @labels.each_with_index do |label, index|
      puts "No.#{index + 1}) Label_id: #{label.id} label_title: #{label.title}, Label_color: #{label.color}"
    end
  end

  def create_label
    label = ''
    if @labels.empty?
      label_title = get_user_input "No exising label to choose from!\n\nEnter Label title: "
      label_color = get_user_input 'Enter label color: '
      label = Label.new(label_title, label_color)
    else
      choose_label = lambda do
        option = get_user_input "Please choose one of the options below(1 or 2):\n1. Existing label\n2. Create new label:\n Label: "
        case option.to_i
        when 1
          list_all_label
          label_id = get_user_input 'Choose any label by Id from the list above: '
          label = @labels.find { |item| item.id == label_id.to_i }
        when 2
          label_title = get_user_input 'Enter new  label title: '
          label_color = get_user_input 'Enter new  label color: '
          label = Label.new(label_title, label_color)
        else
          choose_label.call
        end
      end
      choose_label.call
    end
    label
  end
end
# rubocop:enable Layout/LineLength, Metrics/MethodLength
