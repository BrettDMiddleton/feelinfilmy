import "typeahead.js";

// Docs: https://github.com/twitter/typeahead.js
// Examples: http://twitter.github.io/typeahead.js/examples/

// Copied from typeahead documentation
const substringMatcher = (strs) => {
  return (q, cb) => {
    let matches, substringRegex;
    matches = [];
    substringRegex = new RegExp(q, 'i');
    $.each(strs, (i, str) => {
      if (substringRegex.test(str)) {
        matches.push(str);
      }
    });

    cb(matches);
  };
};

const generateNewTagButton = (name, id) => {
  return (`
  <div class=\"col-xs-6 col-sm-3 col-md-1\">
    <div class=\"cards text-center\">
      <button class=\"btn-filmy2 list-inline active\">
        ${name}
        <input type=\"checkbox\" name=\"clicked_tag[${id}]\" id=\"clicked_tag_${id}\" value=\"1\" checked>
      </button>
    </div>
  </div>
  `);
};

const submitMovieFilterForm = () => {
  document.getElementById("filter-movies").click();
}

const initializeNewTagButton = (tagButtonId) => {
  const tag = document.getElementById(`clicked_tag_${tagButtonId}`);

  tag.addEventListener("click", (event) => {
    event.currentTarget.parentElement.classList.toggle('active');
    submitMovieFilterForm();
  });
}

export const initializeTypeAhead = () => {
  const typeAheadInput = document.querySelector(".typeahead");

  if (typeAheadInput === null) { return false }

  const rowOfTags = document.querySelector(".tags > .row");
  const tagData = JSON.parse(document.getElementById("tag-data").dataset.tags);
  const tagNames = Object.keys(tagData);

  document.addEventListener("keyup", (event) => {
    const selectedTagName = typeAheadInput.value;
    if (
      event.keyCode == 13 &&
      document.activeElement == typeAheadInput &&
      tagNames.includes(selectedTagName)
    ) {
      rowOfTags.insertAdjacentHTML("beforeend", generateNewTagButton(selectedTagName, tagData[selectedTagName]));
      initializeNewTagButton(tagData[selectedTagName]);
      submitMovieFilterForm();
      typeAheadInput.value = "";
    };
  });

  $('#the-basics .typeahead').typeahead({
    hint: true,
    highlight: true,
    minLength: 1
  },
  {
    name: 'tagNames',
    source: substringMatcher(tagNames),
    templates: {
      empty: [
        '<div class="empty-message">',
          'no matches',
        '</div>'
      ].join('\n'),
      suggestion: (data) => {
        return `<div>${data}</div>`
      }
    }    
  });
}


