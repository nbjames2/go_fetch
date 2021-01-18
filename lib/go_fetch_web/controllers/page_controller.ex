defmodule GoFetchWeb.PageController do
  use GoFetchWeb, :controller

  def index(conn, _params) do
    # render(conn, "index.html")
    html conn, """
      <!doctype html>
      <form method=post action=/getuserinfo>
        <input type=text name=username placeholder="Enter your Github username" style="width: 250px;" />
        <button type=submit>Submit</button>
      </form>
    """
  end

  def get_info(conn, %{"username" => username}) do
    # query github
    data = GoFetch.GitCaller.getRepos(username)
    
    # pull data out and sanitize result
    repos = data.data.user.watching.nodes
    reposHTML = ""
    reposHTML = Enum.reduce(repos, "", fn(x, acc)->
      acc <> """
        <tr>
          <td style="border: 1px solid #ccc; padding: 4px 8px;"><a href=#{x.url}>#{x.name}</a></td>
          <td style="border: 1px solid #ccc; padding: 4px 8px;">#{x.updatedAt}</td>
        </tr>
      """
    end)
    # build html
    rawHTML = """
    <!doctype html>
    <body>
      <form method=post action=/getuserinfo>
        <input type=text name=username placeholder="Enter your Github username" style="width: 250px;" />
        <button type=submit>Submit</button>
      </form>
      <div style="display: flex; align-items: center;">
        <img src="#{data.data.user.avatarUrl}" alt="users profile avatar" style="margin: 24px;" />
        <h1 style="margin-left: 24px;">#{username}</h1>
      </div>
      <table style="border: 1px solid; border-collapse: collapse;">
        <thead>
          <tr>
            <th style="border: 1px solid; background: #dddddd; padding: 8px 4px;">Repositories</th>
            <th style="border: 1px solid; background: #dddddd; padding: 8px 4px;">Last Updated</th>
          </tr>
        </thead>
        <tbody>
    """
    rawHTML = rawHTML <> reposHTML <> "</tbody></table></body>"
    IO.puts rawHTML
    html conn, rawHTML
  end
end
