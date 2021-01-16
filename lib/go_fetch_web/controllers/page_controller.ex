defmodule GoFetchWeb.PageController do
  use GoFetchWeb, :controller

  def index(conn, _params) do
    # render(conn, "index.html")
    html conn, """
      <!doctype html>
      <form method=post action=/getuserinfo>
        <input type=text name=username placeholder="Enter your Github username" />
        <button type=submit>Submit</button>
      </form>
    """
  end

  def get_info(conn, %{"username" => username}) do
    # query github
    rawData = Repo.getRepos(username)
    # pull data out and sanitize result
    result
    # build html
    rawhtml = """
    <!doctype html>
    <form method=post action=/getuserinfo>
      <input type=text name=username placeholder="Enter your Github username" />
      <button type=submit>Submit</button>
    </form>
    """
    html conn, rawhtml
  end
end
