class MongodbMsgq < ApplicationMsgq

  def self.request(payload)
  end

  def self.requestSync(payload)
    class_name = payload.class.name.demodulize
    if class_name == 'ProcessColumnsRequest'
      q = ProcessColumnsRequestQueue.new
      q.process_columns_request_id = payload.id
      q.save
      id = q.id
      begin
        q = ProcessColumnsRequestQueue.find(id)
        status = q.status
        puts status
        sleep 1
      end until status != 'pendding'
    end

  end

end
