# Prompt: build an interactive mind map of my dev.to posts

Replace `<USERNAME>` with your dev.to handle and paste the prompt into a new chat.

---

Build an interactive mind map of **every post** on **https://dev.to/<USERNAME>**, including the newest one. The goal is to show **why** each post connects to the others, not just to list them.

## 1. Research
- Fetch my dev.to profile and collect every post: title, slug/URL, date, tags and reaction count.
- The profile page may be cached and miss the newest posts. Check the "More from <USERNAME>" links at the bottom of the most recent articles until no new titles appear.
- Read as many posts in full as you can, at least the most recent ones and the most-linked ones. Note every link a post makes to my other posts.

## 2. Structure
- Group the posts into **6–8 thematic threads** (hubs) based on content, not just tags. Give each thread a short name and a one-sentence description.
- Pick **one root post**: the one that best summarises me, or that the most other posts link back to. Put it in the centre.
- Write down every connection between two posts with a **one-sentence reason**, and sort each connection into one of two kinds:
  - **explicit**: I linked or cited the other post, it is a numbered part of the same series, or it continues the same project.
  - **inferred**: the connection is your interpretation (same idea, same motif, a sequel in spirit).
  Never present an inferred connection as explicit.
- Write a **3-sentence summary** for every post. Mark whether each summary comes from the full article or only from the title, tags and linking posts.

## 3. Interactive map (single page)
- Layout: the root in the centre, thread hubs on the left and right, and post cards in a column beside their hub. Draw the tree as curved branches. Draw connections as curves between cards: solid for explicit, dashed for inferred.
- Colour: give each thread one colour on a dark background. Use small, quiet type. Keep the header to one line: `DEV.TO/<USERNAME> :: POST MAP · <first date> – <last date>`, plus zoom − / fit / +.
- Click a post to highlight it, its thread and its connected posts, and dim everything else. Show numbered badges on the highlighted connection lines.
- Side panel:
  - Post selected: thread, title, date, tags, reactions, the 3-sentence summary, a "Read on dev.to ↗" link, and a numbered list of connections, each with its reason and the label "you linked it" or "inferred". Clicking a listed connection selects that post.
  - Thread selected: its description and its posts, oldest first.
  - Nothing selected: an overview of all threads.
- Keyboard: the arrow keys move to the nearest node in that direction, and the view scrolls to keep it visible. Esc returns to the overview.
- Settings: show or hide the inferred links and the tree branches.

## 4. GitHub export
- `index.html`: the interactive map as one self-contained, offline file, for GitHub Pages.
- `mindmap.svg`: a static version where every post card is an `<a>` link to its article and every connection line has a `<title>` tooltip with its reason. Use system fonts and hex colours so GitHub renders it correctly.
- `README.md`: the SVG as an image, linked to the Pages URL, plus a short description.
- Package these three files as a downloadable `repo/` folder, and tell me the git commands to push it and turn on Pages.

## Rules
- Use only real data from my profile and articles. If something is unknown (such as the reactions on a very new post), leave it empty.
- Be clear about which posts you read in full and which you didn't.
- Write in English unless I ask otherwise.
