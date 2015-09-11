class Admin::DataExportController < Admin::AdminController
  def download
    file = Tempfile.new("wakoku")
    file.write create_tab
    file.rewind
    send_file file.path, type: "text/plain; charset=utf-8", filename: "wakoku.tab", disposition: "attachment"
  end

  private
  def create_tab
    fields = ["id", "writing", "kana", "romaji", "definition_de", "definition_en", "definition_fr", "textbox_de", "textbox_en"]
    fields.join("\t") + "\n" + Entry.select(fields).map{|entry| entry.attributes.values.join("\t") }.join("\n")
  end
end
