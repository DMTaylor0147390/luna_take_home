defmodule LunaTakeHome do
  @moduledoc """
  LunaTakeHome keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  def handle_url(url) do
    IO.inspect(url)
  end

  def parse_url(url) do
    {:ok, resp} = handle_url(url)
    if resp.status_code in 200..299 do
      Floki.parse_document(resp.body)
    end
  end

  def dummy_example() do
    s = """
    <html prefix="og: http://ogp.me/ns#">
    <head>
    <title>Luna Care: On-Demand Physical Therapy</title>
    <meta property="og:title" content="Luna Care - Physical therapy,
    delivered to you">
    <meta property="og:type" content="website">
    <meta property="og:url" content="https://www.getluna.com/">
    <meta property="og:image"
    content="https://www.getluna.com/assets/images/we_come_to_you.svg">
    </head>
    </html>
    """
    Floki.parse_document(s)
  end

  def extract_og_image_content([{"html", _, children}]) do
    Enum.flat_map(children, &extract_og_image_content/1)
    |> Enum.filter(fn x -> x end)
  end

  def extract_og_image_content({"head", _, children}) do
    Enum.map(children, &extract_og_image_content/1)
  end

  def extract_og_image_content({"meta", props, children}) do
    props_map = Map.new(props)
    if props_map["property"] == "og:image" do
      props_map["content"]
    else
      false
    end
  end

  def extract_og_image_content({"title", _, _}) do
    false
  end

  def extract_og_image_content([]) do
    false
  end

end
