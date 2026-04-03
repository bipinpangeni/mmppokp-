-- ================================================================
--  THE CHRONICLE — Supabase SQL Schema
--  
--  Go to: Supabase Dashboard → SQL Editor → New Query
--  Paste ALL of this → Click RUN
-- ================================================================

-- Drop existing tables cleanly
DROP TABLE IF EXISTS comments CASCADE;
DROP TABLE IF EXISTS posts CASCADE;
DROP TABLE IF EXISTS pages CASCADE;
DROP TABLE IF EXISTS settings CASCADE;

-- POSTS
CREATE TABLE posts (
  id          BIGSERIAL PRIMARY KEY,
  title       TEXT NOT NULL,
  slug        TEXT UNIQUE NOT NULL,
  excerpt     TEXT,
  content     TEXT,
  image_url   TEXT,
  category    TEXT,
  author      TEXT DEFAULT 'The Chronicle',
  status      TEXT DEFAULT 'draft' CHECK(status IN ('published','draft')),
  meta_title  TEXT,
  meta_desc   TEXT,
  views       INTEGER DEFAULT 0,
  created_at  TIMESTAMPTZ DEFAULT NOW(),
  updated_at  TIMESTAMPTZ DEFAULT NOW()
);

-- COMMENTS
CREATE TABLE comments (
  id          BIGSERIAL PRIMARY KEY,
  post_id     BIGINT NOT NULL REFERENCES posts(id) ON DELETE CASCADE,
  name        TEXT NOT NULL,
  email       TEXT,
  body        TEXT NOT NULL,
  approved    BOOLEAN DEFAULT TRUE,
  created_at  TIMESTAMPTZ DEFAULT NOW()
);

-- PAGES
CREATE TABLE pages (
  id          BIGSERIAL PRIMARY KEY,
  key         TEXT UNIQUE NOT NULL,
  title       TEXT NOT NULL,
  content     TEXT,
  updated_at  TIMESTAMPTZ DEFAULT NOW()
);

-- SETTINGS
CREATE TABLE settings (
  key   TEXT PRIMARY KEY,
  value TEXT
);

-- Disable RLS (anon key has full access, admin auth handled in frontend)
ALTER TABLE posts    DISABLE ROW LEVEL SECURITY;
ALTER TABLE comments DISABLE ROW LEVEL SECURITY;
ALTER TABLE pages    DISABLE ROW LEVEL SECURITY;
ALTER TABLE settings DISABLE ROW LEVEL SECURITY;

-- DEFAULT SETTINGS
INSERT INTO settings VALUES ('site_name',        'The Chronicle');
INSERT INTO settings VALUES ('tagline',          'Thoughtful articles on technology, culture, and design.');
INSERT INTO settings VALUES ('contact_email',    'hello@thechronicle.com');
INSERT INTO settings VALUES ('contact_location', 'San Francisco, CA');
INSERT INTO settings VALUES ('footer_text',      '© 2025 The Chronicle. All rights reserved.');
INSERT INTO settings VALUES ('adsense_client',   '');
INSERT INTO settings VALUES ('adsense_slot1',    '');
INSERT INTO settings VALUES ('adsense_slot2',    '');
INSERT INTO settings VALUES ('adsense_slot3',    '');
INSERT INTO settings VALUES ('posts_per_page',   '6');
INSERT INTO settings VALUES ('admin_password',   'admin123');

-- DEFAULT PAGES
INSERT INTO pages (key, title, content) VALUES (
  'about', 'About Us',
  '<h2>Our Story</h2><p>The Chronicle was founded with a simple mission: to publish thoughtful, well-crafted articles that inform and inspire. We cover technology, design, culture, and the human experience.</p><h2>Our Mission</h2><p>In a world of noise, we strive to be a signal. Every piece we publish meets our high standards of quality and accuracy.</p><h2>Why We Write</h2><p>We believe great writing can change perspectives and spark meaningful conversations. Our writers are experts, storytellers, and curious humans who believe words matter.</p>'
);
INSERT INTO pages (key, title, content) VALUES (
  'privacy', 'Privacy Policy',
  '<h2>1. Information We Collect</h2><p>We collect information you provide directly, such as when you leave a comment or contact us. This may include your name and email address.</p><h2>2. How We Use Information</h2><p>We use collected information to respond to inquiries, publish your comments with permission, and improve our website.</p><h2>3. Cookies</h2><p>This website may use cookies for theme preferences. We do not sell your data to third parties.</p><h2>4. Google AdSense</h2><p>We may use Google AdSense to display advertisements. Google may use cookies based on your prior visits. You can opt out at Google Ads Settings.</p><h2>5. Contact</h2><p>For privacy concerns, contact us via the Contact page.</p>'
);
INSERT INTO pages (key, title, content) VALUES (
  'terms', 'Terms & Conditions',
  '<h2>1. Acceptance of Terms</h2><p>By accessing this website, you agree to these terms and conditions.</p><h2>2. Content Ownership</h2><p>All content on this site is property of The Chronicle and may not be reproduced without written permission.</p><h2>3. User Comments</h2><p>By submitting a comment, you grant us a license to publish it. Spam or offensive comments will be removed.</p><h2>4. Disclaimer</h2><p>Content is provided for informational purposes only. We make no warranties about accuracy.</p><h2>5. Advertising</h2><p>This site may display advertisements served by Google AdSense and other networks.</p>'
);

-- SAMPLE POSTS
INSERT INTO posts (title, slug, excerpt, content, category, author, status, image_url) VALUES (
  'The Art of Slow Thinking in a Fast World',
  'art-of-slow-thinking',
  'In our hyper-connected age, the ability to think slowly and deliberately has become a superpower. Here''s how to cultivate it.',
  '# The Art of Slow Thinking in a Fast World

In a world that celebrates speed, the ability to think slowly has become one of the most underrated cognitive skills.

## Why Slow Thinking Matters

Daniel Kahneman''s work distinguishes between two modes of thinking. System 1 is fast, instinctive, and emotional. System 2 is slower, deliberative, and logical.

> "The real problem is not whether machines think but whether men do." — B.F. Skinner

## Practices for Deliberate Thought

- **Journaling**: Writing forces you to articulate fuzzy ideas with precision.
- **Long-form reading**: Books demand sustained attention that social media does not.
- **Walking without devices**: Let your mind wander without interruption.
- **Sleep on decisions**: Your subconscious continues processing overnight.

## The Paradox of Productivity

Counter-intuitively, people who think slowly often produce better outcomes. They make fewer errors, spot more opportunities, and avoid costly mistakes.

This is not a call for procrastination. It is a call for intentionality.',
  'Philosophy', 'Sarah Chen', 'published',
  'https://images.unsplash.com/photo-1544716278-ca5e3f4abd8c?w=800&q=80'
);

INSERT INTO posts (title, slug, excerpt, content, category, author, status, image_url) VALUES (
  'Designing for Emotion: Why Aesthetics Are Not Superficial',
  'designing-for-emotion',
  'Good design is not decoration. It''s communication. It shapes how we feel, think, and act — often without us realizing it.',
  '# Designing for Emotion

For decades there has been a false dichotomy in design: function vs. form. But cognitive science tells a different story.

## The Neuroscience of Beauty

When we encounter something beautiful, our brains release dopamine. Attractive things signal quality and trustworthiness.

## Don Norman''s Three Levels

1. **Visceral** — immediate gut-level reaction to appearance
2. **Behavioral** — pleasure derived from use and function
3. **Reflective** — meaning and self-image conveyed by the product

Great design operates on all three levels simultaneously.

## Practical Implications

- Typography conveys personality before a single word is read
- Color palettes trigger emotional associations
- Micro-interactions create moments of delight
- White space communicates confidence and clarity

> Design is not just what it looks like and feels like. Design is how it works. — Steve Jobs',
  'Design', 'Marcus Rivera', 'published',
  'https://images.unsplash.com/photo-1558655146-9f40138edfeb?w=800&q=80'
);

INSERT INTO posts (title, slug, excerpt, content, category, author, status, image_url) VALUES (
  'The Quiet Revolution in Rural Technology',
  'rural-technology-revolution',
  'Beyond Silicon Valley''s spotlight, something remarkable is happening in small towns and farming communities worldwide.',
  '# The Quiet Revolution in Rural Technology

Some of the most interesting technology adoption stories are happening in places that rarely make headlines.

## Connectivity as Foundation

In the last five years, satellite internet has transformed what is possible in rural areas. Farmers can now access the same cloud platforms as engineers in major cities.

## Real-World Applications

### Precision Agriculture

Modern farming increasingly relies on:
- Drone imagery for crop monitoring
- Soil sensors for precise irrigation
- AI-driven yield predictions
- GPS-guided equipment

## The Human Element

What is fascinating about rural tech adoption is the pragmatism driving it. Tools get adopted when they solve real problems and make economic sense.

## Looking Ahead

The next frontier is telemedicine, remote education, and local e-commerce. The rural digital revolution is just beginning.',
  'Technology', 'Priya Nair', 'published',
  'https://images.unsplash.com/photo-1500382017468-9049fed747ef?w=800&q=80'
);

-- ================================================================
-- STORAGE BUCKET
-- After running this SQL:
-- 1. Go to Supabase → Storage → New bucket
-- 2. Name: blog-images
-- 3. Toggle Public: ON
-- 4. Then run the storage policies below
-- ================================================================

-- Storage Policies (run after creating the bucket)
DROP POLICY IF EXISTS "Public read"    ON storage.objects;
DROP POLICY IF EXISTS "Allow upload"   ON storage.objects;
DROP POLICY IF EXISTS "Allow update"   ON storage.objects;
DROP POLICY IF EXISTS "Allow delete"   ON storage.objects;

CREATE POLICY "Public read"   ON storage.objects FOR SELECT USING (bucket_id = 'blog-images');
CREATE POLICY "Allow upload"  ON storage.objects FOR INSERT WITH CHECK (bucket_id = 'blog-images');
CREATE POLICY "Allow update"  ON storage.objects FOR UPDATE USING (bucket_id = 'blog-images');
CREATE POLICY "Allow delete"  ON storage.objects FOR DELETE USING (bucket_id = 'blog-images');

-- ================================================================
-- ✅ DONE! Your database is ready.
-- Tables: posts, comments, pages, settings
-- Sample data: 3 posts, 3 pages, default settings
-- Admin password: admin123 (change in Admin → Settings)
-- ================================================================
