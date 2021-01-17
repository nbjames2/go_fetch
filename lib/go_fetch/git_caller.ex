defmodule GoFetch.GitCaller do
  def getRepos(username) do
    url = "https://api.github.com/graphql"
    token = "9a458a07bc972bd28acc7740e4df410cdca2e3e6"
    headers = ["Authorization": "Bearer #{token}", "Accept": "Application/json; Charset=utf-8"]
    query = Poison.encode! %{"query" => """
      {user(login: "#{username}") {
        avatarUrl(size:100),
        repositories(isFork:false, first: 100, orderBy: {field: CREATED_AT, direction: DESC}) {
          nodes {
            name,
            updatedAt
          }
        } 
      }}
    """}
    %{body: body} = HTTPoison.post!(url, query, headers)
    IO.puts body
    Poison.decode!(body, keys: :atoms)
  end
end