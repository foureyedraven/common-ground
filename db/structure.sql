--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'SQL_ASCII';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: commonsource_entries; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE commonsource_entries (
    id integer NOT NULL,
    type character varying,
    title character varying,
    slug character varying,
    payload json,
    user_id integer,
    author_name character varying,
    published_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: commonsource_entries_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE commonsource_entries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: commonsource_entries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE commonsource_entries_id_seq OWNED BY commonsource_entries.id;


--
-- Name: commonsource_entry_search_data; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE commonsource_entry_search_data (
    id integer NOT NULL,
    entry_id integer,
    attr_name character varying,
    search_data tsvector,
    raw_data text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: commonsource_entry_search_data_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE commonsource_entry_search_data_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: commonsource_entry_search_data_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE commonsource_entry_search_data_id_seq OWNED BY commonsource_entry_search_data.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY commonsource_entries ALTER COLUMN id SET DEFAULT nextval('commonsource_entries_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY commonsource_entry_search_data ALTER COLUMN id SET DEFAULT nextval('commonsource_entry_search_data_id_seq'::regclass);


--
-- Name: ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: commonsource_entries_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY commonsource_entries
    ADD CONSTRAINT commonsource_entries_pkey PRIMARY KEY (id);


--
-- Name: commonsource_entry_search_data_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY commonsource_entry_search_data
    ADD CONSTRAINT commonsource_entry_search_data_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: idx_search_data; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX idx_search_data ON commonsource_entry_search_data USING gin (search_data);


--
-- Name: index_commonsource_entries_on_slug; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_commonsource_entries_on_slug ON commonsource_entries USING btree (slug);


--
-- Name: index_commonsource_entries_on_type; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_commonsource_entries_on_type ON commonsource_entries USING btree (type);


--
-- Name: index_commonsource_entries_on_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_commonsource_entries_on_user_id ON commonsource_entries USING btree (user_id);


--
-- Name: index_commonsource_entry_search_data_on_entry_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_commonsource_entry_search_data_on_entry_id ON commonsource_entry_search_data USING btree (entry_id);


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user",public;

INSERT INTO schema_migrations (version) VALUES ('20170127223636'), ('20170130200820'), ('20170211012431');


