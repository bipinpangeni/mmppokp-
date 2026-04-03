# 📰 The Chronicle — Cloudflare Pages + Supabase
## Host frontend FREE on Cloudflare Pages. Database on Supabase FREE tier.

---

## 🏗️ Architecture

```
GitHub Repository (your code)
         ↓
Cloudflare Pages  ←  serves public/index.html (free, global CDN)
         ↓  (direct API calls from browser)
Supabase  ←  PostgreSQL database + Storage for images (free)
```

**No backend server needed. No monthly cost.**

---

## 📦 Repository Structure

```
your-repo/
├── schema.sql          ← Run once in Supabase SQL Editor
└── public/
    ├── index.html      ← Complete blog + admin (deploy this)
    ├── _redirects      ← Cloudflare routing rules
    └── _headers        ← Security headers
```

---

## 🚀 COMPLETE SETUP (20 minutes)

### STEP 1 — Create GitHub Repository

1. Go to **github.com** → Sign in → click **"New repository"**
2. Name: `chronicle-blog` (or anything you like)
3. Set to **Public**
4. Click **"Create repository"**
5. Upload ALL files keeping this exact structure:
   ```
   schema.sql
   public/index.html
   public/_redirects
   public/_headers
   ```

---

### STEP 2 — Set Up Supabase Database

1. Go to **supabase.com** → Sign up free → **"New project"**
2. Choose a name, set a database password, pick closest region
3. Wait ~2 minutes for project to start
4. Go to **SQL Editor** (left sidebar) → **"New query"**
5. Open `schema.sql` from this folder → **copy ALL contents**
6. Paste into SQL Editor → click **"Run"**
7. You should see **"Success"** ✅

---

### STEP 3 — Create Storage Bucket

1. In Supabase → click **"Storage"** (left sidebar)
2. Click **"New bucket"**
3. Name: **`blog-images`** (exactly this)
4. Toggle **"Public bucket"** → **ON**
5. Click **"Create bucket"**

*(The storage policies were already created by schema.sql)*

---

### STEP 4 — Get Your Supabase Credentials

1. In Supabase → click **"Settings"** (gear icon, bottom left)
2. Click **"API"**
3. Copy these two values:
   - **Project URL** → looks like: `https://abcdefghijk.supabase.co`
   - **anon public** key → starts with `eyJhbGci...`
4. Keep these safe — you'll enter them in your blog

---

### STEP 5 — Deploy to Cloudflare Pages

1. Go to **dash.cloudflare.com** → sign up free
2. Click **"Workers & Pages"** → **"Create application"**
3. Click **"Pages"** tab → **"Connect to Git"**
4. Authorize GitHub → select your `chronicle-blog` repository
5. Configure:
   - **Framework preset:** None
   - **Build command:** *(leave completely empty)*
   - **Build output directory:** `public`
6. Click **"Save and Deploy"**
7. Wait ~1 minute → your blog is live! 🎉

Your URL will be: `https://chronicle-blog.pages.dev`

---

### STEP 6 — Connect Your Blog to Supabase

1. Open your live blog: `https://chronicle-blog.pages.dev`
2. You'll see the **"Connect Supabase"** setup screen
3. Enter your:
   - **Project URL** from Step 4
   - **Anon Key** from Step 4
4. Click **"Connect & Launch"**
5. Your blog loads with 3 sample posts! ✅

---

### STEP 7 — Access Admin Panel

- Click **"Admin Panel"** in the footer
- **Password:** `admin123`
- Change it in: **Admin → Settings → Change Admin Password**

---

## 🔄 Future Updates (Automatic!)

Once connected to GitHub, every time you push code:
```bash
git add .
git commit -m "Update blog"
git push
```
Cloudflare auto-deploys in **~30 seconds**. ✅

---

## 💰 Google AdSense Setup

After your blog is on a real domain with 10+ quality articles:

1. Apply at **adsense.google.com**
2. Enter your blog URL (custom domain, not .pages.dev)
3. Wait for approval (1–4 weeks)
4. After approval → get your **Publisher ID** (`ca-pub-XXXXXXXX`)
5. Create ad units → get **Slot IDs**
6. In your blog: **Admin → AdSense** → enter IDs → Save
7. Ads appear automatically on homepage and inside posts! 💰

---

## 🔍 Get Posts on Google (SEO)

1. Go to **search.google.com/search-console**
2. Add your domain as a property
3. Verify ownership (follow Google's steps)
4. In your blog: **Admin → Sitemap** → click **"Download"**
5. Upload `sitemap.xml` to your Cloudflare Pages (in `public/` folder)
6. In Search Console → **Sitemaps** → enter `sitemap.xml` → Submit
7. Google starts indexing your posts within days ✅

---

## 🌐 Add Custom Domain (Recommended for AdSense)

1. Buy a domain (~$10/year from Namecheap, Cloudflare Registrar, etc.)
2. In Cloudflare Pages → your project → **"Custom domains"**
3. Click **"Set up a custom domain"** → enter your domain
4. Follow DNS setup (usually automatic if domain is on Cloudflare)
5. Your blog is now at `https://yourdomain.com`

---

## 🆓 Free Tier Limits

| Service | Free Limit |
|---------|-----------|
| Cloudflare Pages | Unlimited sites, 500 builds/month, unlimited traffic |
| Supabase Database | 500 MB, 2GB bandwidth/month |
| Supabase Storage | 1 GB storage, 2GB bandwidth/month |
| **Total** | **$0/month** |

More than enough for a growing blog!

---

## ❓ Troubleshooting

| Problem | Solution |
|---------|----------|
| "Could not connect" error | Check URL format: `https://xxx.supabase.co` (no slash at end). Use **anon public** key, not service_role key |
| Posts not showing | Make sure you ran schema.sql fully in Supabase SQL Editor |
| Images not uploading | Check bucket name is exactly `blog-images` and Public is ON |
| Can't login | Default password is `admin123` |
| Blog not updating | Check Cloudflare → Deployments for any build errors |
| "Table not found" error | Re-run schema.sql — it drops and recreates all tables cleanly |

---

## 📝 How to Write Posts

1. Go to your blog → footer → **Admin Panel** → login
2. Click **"New Post"** in sidebar
3. Fill in: Title, Excerpt, Content (Markdown), Category, Author
4. Upload featured image or paste an image URL
5. Fill in SEO fields (Meta Title, Meta Description) for better Google ranking
6. Click **🚀 Publish** — post appears on homepage instantly!

### Markdown Guide
```
# Heading 1
## Heading 2
**bold**  *italic*  `code`
[Link text](https://url.com)
> Blockquote
- Bullet item
1. Numbered item
```

---

*The Chronicle — Cloudflare Pages + Supabase = Free Forever*
