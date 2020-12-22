# Changes from default Jekyll Minima theme

* Add assets/main.scss and change color scheme parameters.

* Add _drafts/ and place new posts there. No date is required in the name for draft posts.

* To render the site with drafts, add the `--drafts` argument after the `jekyll serve` command.

* run `bundle info minima` to find the location of your minima directory

* copy the `home.html` file from the default minima/_layouts directory to your site/_layouts directory

* modify to add:

```ruby
      {%- for post in site.posts -%}
        {% if post.draft %}
          {% if site.show_drafts %}
            {% assign show_post = true %}
          {% else %} 
            {% assign show_post = false %}
          {% endif %}
        {% else %}
          {% assign show_post = true %}
        {% endif %}
          <!-- This is not a draft. Allow post to be displayed in blog lists and RSS feed --> 
          <!-- This is a draft. Allow blog to be displayed in draft blog lists. Use in blog page layout to display a warning that the page is a draft. -->
        {% if show_post %}
        <li>
          {%- assign date_format = site.minima.date_format | default: "%b %-d, %Y" -%}
          <span class="post-meta">{{ post.date | date: date_format }}</span>
          <h3>
            <a class="post-link" href="{{ post.url | relative_url }}">
              {{ post.title | escape }}
            </a>
          </h3>
          {%- if site.show_excerpts -%}
            {{ post.excerpt }}
          {%- endif -%}
        </li>
        {% endif %}
      {%- endfor -%}
```

* Now, you have a _drafts/ directory where you can work on posts that you aren't ready to publish. When you are ready to share them with others for review, you can move them to the _posts directory but keep the label draft:true in the post file. They won't be shown in your site index, but you can still view the page if you know the URL.
