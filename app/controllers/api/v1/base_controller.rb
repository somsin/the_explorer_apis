class Api::V1::BaseController < ActionController::Base

  def render_json_success(success_response)
    render :json => {:http_code => 200}.merge(success_response)
  end

  def render_json_multi_status(multi_status_response)
    render :json => {:http_code => 207}.merge(multi_status_response)
  end

  def render_json_failure(failure_response)
    render :json => {:http_code => 400}.merge(failure_response)
  end

  def render_json_forbidden(forbidden_response)
    render :json => {:http_code => 403}.merge(forbidden_response)
  end

end