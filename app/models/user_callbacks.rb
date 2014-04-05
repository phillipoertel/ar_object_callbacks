class UserCallbacks

  cattr_accessor :enabled

  def after_create(user)
    call_url(user) if callbacks_enabled?
  end

  private

    def call_url(user)
      url = "http://some-service.com/new_user=#{user.name}"
      URI.open(url)
    end

    def callbacks_enabled?
      !!self.class.enabled
    end

end